return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    },
    opts = {
        defaults = {
            layout_strategy = "vertical",
            -- layout_config = { width = 0.9 },
        },
        extensions = {
            wrap_results = true,
        },
    },
    config = function()
        require('telescope').load_extension('fzf')

        local builtin = require("telescope.builtin")

        vim.keymap.set('n', '<leader>fd', builtin.find_files)
        vim.keymap.set('n', '<leader>fs', function()
            vim.fn.inputsave()
            local foo = vim.fn.input("specific search: ")
            vim.fn.inputrestore()
            builtin.find_files({ cwd = "./" .. foo, hidden = true, no_ignore = true })
        end
        )

        vim.keymap.set('n', '<leader>fl', builtin.live_grep)
        vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find)
        vim.keymap.set('n', '<leader>gw', builtin.grep_string)
        vim.keymap.set('n', '<leader>fh', builtin.help_tags)
        vim.keymap.set('n', '<leader>fg', builtin.git_files)
    end,
}
