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

    -- markdown
    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    -- setup copilot by recommended projet from lsp zero

    -- LSP Support
    'neovim/nvim-lspconfig',             -- Required
    'williamboman/mason.nvim',           -- Optional
    'williamboman/mason-lspconfig.nvim', -- Optional

    -- Autocompletion
    'hrsh7th/nvim-cmp',         -- Required
    'hrsh7th/cmp-nvim-lsp',     -- Required
    'hrsh7th/cmp-buffer',       -- Optional
    'hrsh7th/cmp-path',         -- Optional
    'hrsh7th/cmp-nvim-lua',     -- Optional
    'saadparwaiz1/cmp_luasnip', -- Optional

    -- Autoformatting
    "lukas-reineke/lsp-format.nvim", -- Required

    -- Lua
    'folke/neodev.nvim', -- Required

    -- Snippets
    {
        'L3MON4D3/LuaSnip', -- Required
        version = "v2.*",
        build = "make install_jsregexp",
    },
    'rafamadriz/friendly-snippets', -- Optional
}
