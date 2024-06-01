return {
    "theprimeagen/harpoon",
    -- TODO current config is not compatible with v2
    -- branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    init = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>a", mark.add_file)
        vim.keymap.set("n", "<c-e>", ui.toggle_quick_menu)

        -- vim.keyma.set("n", "<c-h>", function() ui.nav_file(1) end)
        -- vim.keyma.set("n", "<c-t>", function() ui.nav_file(2) end)
        -- vim.keyma.set("n", "<c-r>", function() ui.nav_file(3) end)
        -- vim.keyma.set("n", "<c-s>", function() ui.nav_file(4) end)
    end
}
