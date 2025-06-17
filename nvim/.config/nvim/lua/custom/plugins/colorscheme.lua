return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "night",
            transparent = false
        },
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            compile = true,
            overrides = function()
                return {
                    ["@markup.list.checked.markdown"] = { link = "WarningMsg" }
                }
            end,
        },
        build = function()
            vim.cmd [[KanagawaCompile]]
        end
    }
}
