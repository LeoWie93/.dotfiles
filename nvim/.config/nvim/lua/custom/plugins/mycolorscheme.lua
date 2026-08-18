local M = {}

-- 1. Define color palettes for dark and light modes
local palettes = {
    dark = {
        bg        = "#1e1e2e",
        fg        = "#cdd6f4",
        comment   = "#6c7086",
        keyword   = "#cba6f7",
        string    = "#a6e3a1",
        func      = "#89b4fa",
        selection = "#313244",
        line_nr   = "#45475a",
        cursor_ln = "#252636",
        border    = "#45475a",
    },
    light = {
        bg        = "#eff1f5",
        fg        = "#4c4f69",
        comment   = "#9ca0b0",
        keyword   = "#8839ef",
        string    = "#40a02b",
        func      = "#1e66f5",
        selection = "#acb0be",
        line_nr   = "#bcc0cc",
        cursor_ln = "#e6e9ef",
        border    = "#bcc0cc",
    },
}

function M.load()
    -- Clear existing highlights
    vim.cmd("highlight clear")
    if vim.fn.exists("syntax_on") == 1 then
        vim.cmd("syntax reset")
    end

    -- Register scheme name
    vim.g.colors_name = "mycolorscheme"

    -- Pick palette based on Neovim's vim.o.background setting
    local mode = vim.o.background == "light" and "light" or "dark"
    local p = palettes[mode]

    -- Define highlight group mappings
    local highlights = {
        -- Editor UI
        Normal        = { fg = p.fg, bg = p.bg },
        Visual        = { bg = p.selection },
        LineNr        = { fg = p.line_nr },
        CursorLine    = { bg = p.cursor_ln },
        CursorLineNr  = { fg = p.keyword, bold = true },
        FloatBorder   = { fg = p.border, bg = p.bg },
        NormalFloat   = { fg = p.fg, bg = p.bg },

        -- Syntax Highlighting
        Comment       = { fg = p.comment, italic = true },
        Constant      = { fg = p.keyword },
        String        = { fg = p.string },
        Function      = { fg = p.func },
        Keyword       = { fg = p.keyword, bold = true },
        Statement     = { fg = p.keyword },
        Type          = { fg = p.func },
        Identifier    = { fg = p.fg },

        -- Treesitter Links
        ["@comment"]  = { link = "Comment" },
        ["@keyword"]  = { link = "Keyword" },
        ["@string"]   = { link = "String" },
        ["@function"] = { link = "Function" },
    }

    -- Apply highlight groups
    for group, opts in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, opts)
    end
end

function M.setup()
    M.load()

    -- Watch for vim.o.background changes and dynamically re-apply
    vim.api.nvim_create_autocmd("OptionSet", {
        pattern = "background",
        callback = function()
            if vim.g.colors_name == "mycolorscheme" then
                M.load()
            end
        end,
    })
end

return M
