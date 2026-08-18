vim.pack.add({
    "https://github.com/folke/lazydev.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/williamboman/mason.nvim",
    "https://github.com/williamboman/mason-lspconfig.nvim",
})

-- Shared capabilities for blink.cmp
local has_blink, blink_cmp = pcall(require, 'blink.cmp')
local capabilities = vim.tbl_deep_extend(
    "force",
    vim.lsp.protocol.make_client_capabilities(),
    has_blink and blink_cmp.get_lsp_capabilities() or {}
)

-- LSP Attach
local lsp_fmt_group = vim.api.nvim_create_augroup('LspFormatting', { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client then return end

        if client:supports_method('textDocument/formatting', ev.buf) then
            vim.api.nvim_clear_autocmds({ group = lsp_fmt_group, buffer = ev.buf })
            vim.api.nvim_create_autocmd('BufWritePre', {
                group    = lsp_fmt_group,
                buffer   = ev.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = ev.buf, id = client.id })
                end
            })
        end

        --keymaps
        local opts = function(desc) return { buffer = ev.buf, desc = desc } end

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts("Go to type definition"))
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("Go to references"))

        vim.keymap.set("n", "<leader>gra", vim.lsp.buf.code_action, opts("Code actions"))
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename symbol"))

        vim.keymap.set("n", "<leader>dk", function() vim.diagnostic.jump({ count = -1 }) end, opts("Previous diagnostic"))
        vim.keymap.set("n", "<leader>dj", function() vim.diagnostic.jump({ count = 1 }) end, opts("Next diagnostic"))
        vim.keymap.set("n", "<leader>dO", function() vim.diagnostic.open_float({ scope = "line" }) end,
            opts("Line diagnostics"))
        vim.keymap.set("n", "<leader>do", function() vim.diagnostic.open_float({ scope = "cursor" }) end,
            opts("Cursor diagnostics"))
        vim.keymap.set("n", "<leader>dt", '<cmd>Telescope diagnostics<cr>', opts("Telescope diagnostics"))
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

-- Global defaults for ALL language servers
vim.lsp.config('*', {
    capabilities = capabilities,
})

vim.lsp.config('clangd', {
    capabilities = vim.tbl_deep_extend("force", capabilities, {
        offsetEncoding = { "utf-8", "utf-16" },
        textDocument = {
            completion = {
                editsNearCursor = true
            }
        }
    })
})

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
    severity_sort = true,
    on_jump = true,
})
