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
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/norcalli/nvim-colorizer.lua',
    'https://github.com/j-hui/fidget.nvim',
    'https://github.com/rcarriga/nvim-notify',
    'https://github.com/folke/which-key.nvim',
    --'https://github.com/nvim-treesitter/playground', -- just for fun :TSPlayground --
})

require('fidget').setup({})
require('which-key').setup()

require('custom.plugins.oil')
require('custom.plugins.treesitter')
require('custom.plugins.telescope')
require('custom.plugins.colorschemes')
require('custom.plugins.lsp')
require('custom.plugins.completion')

vim.cmd("colorscheme kanagawa")
