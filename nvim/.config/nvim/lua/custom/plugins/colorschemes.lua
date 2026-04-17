vim.pack.add({
    "https://github.com/rebelot/kanagawa.nvim",
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
