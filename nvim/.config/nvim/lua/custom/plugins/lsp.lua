return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then return end

                    if client.supports_method('textDocument/formatting') then
                        vim.api.nvim_create_autocmd('BufWritePre', {
                            buffer   = args.buf,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                            end
                        })
                    end
                end,
            })
        end,

    },
    {
        'williamboman/mason-lspconfig.nvim',
        version = "^1",
        dependencies = {
            {
                'williamboman/mason.nvim',
                version = "^1",
            }
        },
        opts = {
            automatic_enabled = false,
            ensure_installed = {
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
        },
        config = function()
            -- lspconfig
            local lspconfig = require('lspconfig')

            -- TODO is this really needed here? I do not think so
            require('mason').setup()

            -- setup each language server with keybindings and capabilities
            local on_attach = function(client, bufnr)
                vim.keymap.set("n", "gd", '<cmd>lua vim.lsp.buf.definition()<cr>', { buffer = bufnr })
                vim.keymap.set("n", "gi", '<cmd>lua vim.lsp.buf.implementation()<cr>', { buffer = bufnr })
                vim.keymap.set("n", "gt", '<cmd>lua vim.lsp.buf.type_definition()<cr>', { buffer = bufnr })
                vim.keymap.set("n", "gr", '<cmd>lua vim.lsp.buf.references()<cr>', { buffer = bufnr })

                vim.keymap.set("n", "<leader>gra", '<cmd>lua vim.lsp.buf.code_action()<cr>', { buffer = bufnr })
                vim.keymap.set("n", "<leader>rn", '<cmd>lua vim.lsp.buf.rename()<cr>', { buffer = bufnr })

                vim.keymap.set("n", "<leader>dk", '<cmd>lua vim.diagnostic.goto_prev()<cr>', { buffer = bufnr })
                vim.keymap.set("n", "<leader>dj", '<cmd>lua vim.diagnostic.goto_next()<cr>', { buffer = bufnr })
                vim.keymap.set("n", "<leader>dt", '<cmd>Telescope diagnostics<cr>', { buffer = bufnr })
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
                end,
            }
        end
    }
}
