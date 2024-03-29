local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'ansiblels',
    'bashls',
    'dockerls',
    'docker_compose_language_service',
    'eslint',
    'html',
    'jsonls',
    'lua_ls',
    'gopls',
    'rust_analyzer',
    'tsserver',
    'yamlls',
    'lemminx'
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-space>'] = cmp.mapping.complete()
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)

    lsp.buffer_autoformat()
end)


lsp.configure('gopls', {
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
        }
    }
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
})
