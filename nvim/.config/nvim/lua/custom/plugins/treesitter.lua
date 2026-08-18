vim.pack.add({
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        version = 'main',
    },
    "https://github.com/nvim-treesitter/nvim-treesitter-context",
    "https://github.com/rrethy/vim-illuminate"
})

local ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "diff",
    "dockerfile",
    "gitignore",
    "go",
    "html",
    "javascript",
    "json",
    "lua",
    "luadoc",
    "luap",
    "markdown",
    "markdown_inline",
    "php",
    "python",
    "query",
    "regex",
    "rust",
    "typescript",
    "vim",
    "vimdoc",
    "xml",
    "yaml",
}

require("nvim-treesitter").setup({
    ensure_installed = ensure_installed,
})

-- Sticky Context Setup
require('treesitter-context').setup({
    enable = true,
    max_lines = 3,
    min_window_height = 0,
    line_numbers = true,
    multiline_threshold = 1,
    trim_scope = 'outer',
    mode = 'cursor',
})

vim.keymap.set("n", "[c", function()
    require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true, desc = "Jump to parent function scope" })

-- Automatically start Treesitter syntax highlighting when opening files
vim.api.nvim_create_autocmd("FileType", {
    callback = function(ev)
        pcall(vim.treesitter.start, ev.buf)
    end,
})
