vim.pack.add({
    "https://github.com/rebelot/kanagawa.nvim",
    'https://github.com/catppuccin/nvim'
})

require('kanagawa').setup({
    compile = true,
    theme = "wave",    -- Load "wave" theme
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
