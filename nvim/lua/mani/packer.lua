-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- nvim theme
    use 'folke/tokyonight.nvim'

    -- based treesitter
    use({
        'nvim-treesitter/nvim-treesitter',
        { run = ':TSUpdate' }
    })
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })
    use({
        "nvim-treesitter/nvim-treesitter-refactor",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })
    use({
        'nvim-treesitter/playground',
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter"
    })

    -- based swapping
    use('ThePrimeagen/harpoon')

    -- undotree
    use('mbbill/undotree')

    -- git
    use('tpope/vim-fugitive')

    -- lsp server
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            --- {'williamboman/mason.nvim'},
            --- {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }

    -- status bar
    -- use('vim-airline/vim-airline')
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- latex
    use({ 'lervag/vimtex' })

    --- snippet for lsp
    use({ 'SirVer/ultisnips' })
    use({ 'quangnguyen30192/cmp-nvim-ultisnips' })

    -- add comment support
    use({ 'numToStr/Comment.nvim' })

    -- tmux nvim navigator
    use({ 'christoomey/vim-tmux-navigator' })

    -- bracket autopair
    use({ "windwp/nvim-autopairs" })

    -- lsp function signature
    use({ "hrsh7th/cmp-nvim-lsp-signature-help" })

    -- netrw with icons
    use({ 'prichrd/netrw.nvim' })
    use({ 'nvim-tree/nvim-web-devicons' })

    -- folding code
    use({ 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' })
end)
