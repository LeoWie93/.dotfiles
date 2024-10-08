require('neodev').setup()

-- lspconfig
local lspconfig = require('lspconfig')

-- install with mason
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'ansiblels',
        'bashls',
        'dockerls',
        'docker_compose_language_service',
        'eslint',
        'gopls',
        'html',
        'emmet_ls',
        'htmx',
        'jsonls',
        'lua_ls',
        'lemminx',
        'rust_analyzer',
        'ts_ls',
        'yamlls',
    }
})

-- setup each language server with keybindings and capabilities
local on_attach = function(client, bufnr)
    vim.keymap.set("n", "gd", '<cmd>lua vim.lsp.buf.definition()<cr>', { buffer = bufnr })
    vim.keymap.set("n", "gi", '<cmd>lua vim.lsp.buf.implementation()<cr>', { buffer = bufnr })
    vim.keymap.set("n", "gt", '<cmd>lua vim.lsp.buf.type_definition()<cr>', { buffer = bufnr })
    vim.keymap.set("n", "gr", '<cmd>lua vim.lsp.buf.references()<cr>', { buffer = bufnr })
    vim.keymap.set("n", "<leader>rn", '<cmd>lua vim.lsp.buf.rename()<cr>', { buffer = bufnr })
    vim.keymap.set("n", "<leader>dk", '<cmd>lua vim.diagnostic.goto_prev()<cr>', { buffer = bufnr })
    vim.keymap.set("n", "<leader>dj", '<cmd>lua vim.diagnostic.goto_next()<cr>', { buffer = bufnr })
    vim.keymap.set("n", "<leader>dt", '<cmd>Telescope diagnostics<cr>', { buffer = bufnr })

    require("lsp-format").on_attach(client, bufnr)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason-lspconfig").setup_handlers {
    function(server_name)
        lspconfig[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities
        }
    end,
    ["gopls"] = function()
        lspconfig.gopls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                gopls = {
                    completeUnimported = true,
                    usePlaceholders = true,
                }
            }
        }
    end
}

-- diagnostic fine tuning
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
})
