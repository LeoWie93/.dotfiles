vim.g.mapleader = " "

-- Register hooks for plugin changes
vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name = ev.data.spec.name
        local path = ev.data.path
        local kind = ev.data.kind -- install, update or delete

        if name == 'nvim-treesitter' and (kind == 'update' or kind == 'install') then
            vim.cmd('TSUpdate')
        end

        -- if (name == 'blink.cmp' or name == 'blink') and (kind == 'update' or kind == 'install') then
        --     ---@diagnostic disable-next-line: undefined-field
        --     require('blink.cmp').build():pwait()
        -- end

        if name == 'kanagawa' and (kind == 'update' or kind == 'install') then
            vim.cmd('KanagawaCompile')
        end

        if name == 'telescope-fzf-native' and (kind == 'update' or kind == 'install') then
            vim.system({ 'make' }, { cwd = path })
        end

        if name == 'LuaSnip' and (kind == 'update' or kind == 'install') then
            vim.system({ 'make install_jsregexp' }, { cwd = path })
        end
    end
})

vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-mini/mini.hipatterns',
    'https://github.com/j-hui/fidget.nvim',
    'https://github.com/folke/which-key.nvim',
})

require('fidget').setup({})
require('which-key').setup()

local hipatterns = require('mini.hipatterns')
hipatterns.setup({
    highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
        todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
        note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

        hex_color = hipatterns.gen_highlighter.hex_color(),
    },
})

require('custom.plugins.oil')
require('custom.plugins.treesitter')
require('custom.plugins.telescope')
require('custom.plugins.colorschemes')
require('custom.plugins.completion')
require('custom.plugins.lsp')
require('custom.plugins.ide')
require('custom.plugins.git')

vim.cmd("colorscheme kanagawa")
-- vim.cmd("colorscheme catppuccin-nvim")
