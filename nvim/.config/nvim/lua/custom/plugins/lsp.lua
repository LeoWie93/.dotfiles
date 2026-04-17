vim.pack.add({
    "https://github.com/folke/lazydev.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/williamboman/mason.nvim",
    "https://github.com/williamboman/mason-lspconfig.nvim",
})

-- LSP Attach
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client then return end

        if client:supports_method('textDocument/formatting', ev.buf) then
            vim.api.nvim_create_autocmd('BufWritePre', {
                buffer   = ev.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = ev.buf, id = client.id })
                end
            })
        end

        --keymaps
        vim.keymap.set("n", "gd", '<cmd>lua vim.lsp.buf.definition()<cr>', { buffer = ev.buf })
        vim.keymap.set("n", "gi", '<cmd>lua vim.lsp.buf.implementation()<cr>', { buffer = ev.buf })
        vim.keymap.set("n", "gt", '<cmd>lua vim.lsp.buf.type_definition()<cr>', { buffer = ev.buf })
        vim.keymap.set("n", "gr", '<cmd>lua vim.lsp.buf.references()<cr>', { buffer = ev.buf })

        vim.keymap.set("n", "<leader>gra", '<cmd>lua vim.lsp.buf.code_action()<cr>', { buffer = ev.buf })
        vim.keymap.set("n", "<leader>rn", '<cmd>lua vim.lsp.buf.rename()<cr>', { buffer = ev.buf })

        vim.keymap.set("n", "<leader>dk", '<cmd>lua vim.diagnostic.goto_prev()<cr>', { buffer = ev.buf })
        vim.keymap.set("n", "<leader>dj", '<cmd>lua vim.diagnostic.goto_next()<cr>', { buffer = ev.buf })
        vim.keymap.set("n", "<leader>dO", '<cmd>lua vim.diagnostic.open_float({scope = "line"})<cr>',
            { buffer = ev.buf })
        vim.keymap.set("n", "<leader>do", '<cmd>lua vim.diagnostic.open_float({scope = "cursor"})<cr>',
            { buffer = ev.buf })
        vim.keymap.set("n", "<leader>dt", '<cmd>Telescope diagnostics<cr>', { buffer = ev.buf })
    end,
})

--Setup
require('lazydev').setup({
    library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    }
})

require('mason').setup()
require('mason-lspconfig').setup({
    automatic_enabled = true,
    ensure_installed = {
        'clangd',
        'dockerls',
        'docker_compose_language_service',
        'eslint',
        'gopls',
        'html',
        'emmet_ls',
        'jsonls',
        'lua_ls',
        'lemminx',
        'rust_analyzer',
        'ts_ls',
        'yamlls',
    }
})

--Lsp configurations
vim.lsp.config('gopls', {
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
        }
    }
})

vim.lsp.config('ts_ls', {
    settings = {
        implicitProjectConfiguration = {
            checkJs = true
        },
    }
})

-- Diagnostic
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
})
