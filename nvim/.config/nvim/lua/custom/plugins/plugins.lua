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
}
