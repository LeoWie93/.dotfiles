vim.pack.add({
    "https://github.com/rebelot/kanagawa.nvim",
    'https://github.com/catppuccin/nvim'
})

require('kanagawa').setup({
    compile = true,
    overrides = function()
        return {
            --custom highlighting
            ["@markup.list.checked.markdown"] = { link = "WarningMsg" }
        }
    end,
})
