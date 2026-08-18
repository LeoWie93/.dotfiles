vim.pack.add({
    "https://github.com/rebelot/kanagawa.nvim",
    'https://github.com/catppuccin/nvim'
})

require('catppuccin').setup({
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
})

require('kanagawa').setup({
    compile = true,
    background = {     -- map the value of 'background' option to a theme
        dark = "wave", -- try "dragon" !
        light = "lotus"
    },
    overrides = function()
        return {
            --custom highlighting
            ["@markup.list.checked.markdown"] = { link = "WarningMsg" }
        }
    end,
})
