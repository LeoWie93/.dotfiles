vim.pack.add({
    {
        src = 'https://github.com/Saghen/blink.lib',
    },
    {
        src = 'https://github.com/Saghen/blink.cmp',
        tag = "v1.*"
    },
    {
        src = 'https://github.com/L3MON4D3/LuaSnip',
        tag = "v2.*",
    },
})
local cmp = require('blink.cmp')
cmp.build():pwait()

vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect" }

require('blink.cmp').setup({
    keymap = {
        preset = 'none',
        ['<C-y>'] = { 'select_and_accept' },
        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<C-n>'] = { 'select_next', 'fallback' },
        ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
    },
    completion = {
        list = {
            selection = {
                preselect = false,
                auto_insert = false,
            },
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 50,
        },
    },
    snippets = { preset = 'luasnip' },
    sources = {
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
            lazydev = {
                name = "LazyDev",
                module = "lazydev.integrations.blink",
                score_offset = 100,
            },
            buffer = {
                min_keyword_length = 3,
            },
        },
    },
})

-- snippets
for _, path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
    loadfile(path)()
end

local ls = require "luasnip"
vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })
