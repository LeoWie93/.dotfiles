-- This file can be loaded by calling `lua require('plugins')` from your init.vim

vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        "catppuccin/nvim",
        as = "catppuccin",
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdateSync'
    }

    -- dap - debugging
    use {
        'mfussenegger/nvim-dap',
        'jay-babu/mason-nvim-dap.nvim',
        'rcarriga/nvim-dap-ui'
    }

    use 'theHamsta/nvim-dap-virtual-text'

    -- notifications
    use 'rcarriga/nvim-notify'

    use 'theprimeagen/harpoon'
    use 'mbbill/undotree'
    use 'numToStr/Comment.nvim'

    -- just for fun :TSPlayground
    use { 'nvim-treesitter/playground' }
    use { 'j-hui/fidget.nvim' }

    -- markdown
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- setup copilot by recommended projet from lsp zero

    use {
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
        'L3MON4D3/LuaSnip',             -- Required
        'rafamadriz/friendly-snippets', -- Optional
    }
end)
