-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Load lazy.nvim if installed, otherwise print a message
local ok, lazy = pcall(require, 'lazy')
if not ok then
  print("You need to install lazy.nvim in this folder: " .. lazypath)
  return
end

lazy.setup({
    -- lazy.nvim can manage itself
    { 'folke/lazy.nvim' },

    -- telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.3',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    -- nvim theme
    { 'folke/tokyonight.nvim' },

    -- treesitter and related plugins
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
    },
    {
        "nvim-treesitter/nvim-treesitter-refactor",
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
    },
    {
        'nvim-treesitter/playground',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
    },

    -- useful plugins
    { 'ThePrimeagen/harpoon' },
    { 'mbbill/undotree' },
    { 'tpope/vim-fugitive' },

    -- lsp server and dependencies
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        dependencies = {
            -- Uncomment these if you want to manage LSP servers from Neovim
            -- 'williamboman/mason.nvim',
            -- 'williamboman/mason-lspconfig.nvim',

            -- LSP Support
            'neovim/nvim-lspconfig',
            -- Autocompletion
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
        }
    },

    -- status bar
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    -- latex
    { 'lervag/vimtex' },

    -- snippets
    { 'SirVer/ultisnips' },
    { 'quangnguyen30192/cmp-nvim-ultisnips' },

    -- commenting
    { 'numToStr/Comment.nvim' },

    -- tmux navigator
    { 'christoomey/vim-tmux-navigator' },

    -- autopairs
    { 'windwp/nvim-autopairs' },

    -- LSP signature help
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },

    -- file explorer with icons
    { 'prichrd/netrw.nvim' },
    { 'nvim-tree/nvim-web-devicons' },

    -- folding code
    {
        'kevinhwang91/nvim-ufo',
        dependencies = { 'kevinhwang91/promise-async' },
    },
})
