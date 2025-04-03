-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
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

  -- Autocompletion engine
  { 'saghen/blink.cmp' ,
    version = '1.*',
  },

  -- Snippet engine
  {
    'L3MON4D3/LuaSnip',
    version = "v2.*", -- latest stable
    build = "make install_jsregexp",
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
  },

  -- Optional: LSP UI enhancements
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({})
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },

  -- Optional: auto install language servers
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
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
    { "L3MON4D3/LuaSnip" },

	-- commenting
	{ 'numToStr/Comment.nvim' },

	-- tmux navigator
	{ 'christoomey/vim-tmux-navigator' },

	-- autopairs
	{ 'windwp/nvim-autopairs' },

	-- file explorer with icons
	{ 'prichrd/netrw.nvim' },
	{ 'nvim-tree/nvim-web-devicons' },

	-- folding code
	{
		'kevinhwang91/nvim-ufo',
		dependencies = { 'kevinhwang91/promise-async' },
	},
})
