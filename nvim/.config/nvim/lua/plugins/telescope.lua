return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        defaults = {
            layout_strategy = "vertical",
            -- layout_config = { width = 0.9 },
            vimgrep_arguments = {
                "rg",
                "--follow",        -- Follow symbolic links
                "--hidden",        -- Search for hidden files
                "--no-heading",    -- Don't group matches by each file
                "--with-filename", -- Print the file path with the matched lines
                "--line-number",   -- Show line numbers
                "--column",        -- Show column numbers
                "--smart-case",    -- Smart case search
            }
        }
    },
    init = function()
        local builtin = require("telescope.builtin")

        vim.keymap.set('n', '<leader>fs', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>ff', builtin.live_grep, {})

        vim.keymap.set('n', '<leader>fg', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end)
    end,
}
