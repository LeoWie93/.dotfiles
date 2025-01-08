return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        require('telescope').setup({
            defaults = {
                layout_config = {
                    vertical = { width = 0.5 }
                }
            },
            pickers = {
                find_files = {
                    -- theme = "dropdown",
                }
            },
            extensions = {
                wrap_results = true,
                -- default
                fzf = {
                    fuzzy = true,
                    override_gerneric_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                }
            },
        })

        -- fzf
        require('telescope').load_extension('fzf')

        -- keymaps
        local builtin = require("telescope.builtin")

        vim.keymap.set('n', '<leader>fd', builtin.find_files)
        vim.keymap.set('n', '<leader>fs', function()
            vim.fn.inputsave()
            local foo = vim.fn.input("specific search: ")
            vim.fn.inputrestore()
            builtin.find_files({ cwd = "./" .. foo, hidden = true, no_ignore = true })
        end
        )

        vim.keymap.set('n', '<leader>fl', builtin.live_grep, { desc = "live_grep" })
        vim.keymap.set('n', '<leader>gw', builtin.grep_string, { desc = "grep_string" })
        vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = "current buffer fuzzy" })

        --- help / meta
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "help_tags" })

        --- nvim specific
        vim.keymap.set('n', '<leader>en', function()
            builtin.find_files {
                cwd = vim.fn.stdpath("config")
            }
        end, { desc = "Search nvim config" })

        vim.keymap.set('n', '<leader>ep', function()
            builtin.find_files {
                cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
            }
        end, { desc = "Search nvim packages" })

        --- custom
        require('config.telescope.multigrep').setup()
    end,
}
