vim.pack.add({
    'https://github.com/NeogitOrg/neogit',
    'https://github.com/sindrets/diffview.nvim',
    -- telescope is also a dependency
})

require('neogit').setup({})

vim.keymap.set("n", "<leader>ng", "<cmd>Neogit<cr>", { desc = "Show Neogit UI" })
