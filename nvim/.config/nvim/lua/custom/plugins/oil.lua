return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        columns = { "icon" },
        keymaps = {
            ["<C-h>"] = false,
            ["<M-h>"] = "actions.select_split"
        },
        view_options = {
            show_hidden = true,
        }
    },
    config = function()
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end
}
