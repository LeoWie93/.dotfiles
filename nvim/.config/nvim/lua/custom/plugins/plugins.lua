return {
    -- dap - debugging
    'mfussenegger/nvim-dap',
    'jay-babu/mason-nvim-dap.nvim',
    {
        'rcarriga/nvim-dap-ui',
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
    },
    'theHamsta/nvim-dap-virtual-text',
    {
        'numToStr/Comment.nvim',
        opts = {},
        lazy = false,
    },
    -- setup copilot by recommended projet from lsp zero

    -- LSP Support
    'neovim/nvim-lspconfig',             -- Required
    'williamboman/mason.nvim',           -- Optional
    'williamboman/mason-lspconfig.nvim', -- Optional

    -- Autoformatting
    "lukas-reineke/lsp-format.nvim", -- Required

    -- Lua
    'folke/neodev.nvim', -- Required
}
