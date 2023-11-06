local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	"wbthomason/packer.nvim",

	--required
	"nvim-lua/plenary.nvim",
	"kyazdani42/nvim-web-devicons",
	"nvim-treesitter/nvim-treesitter",

	-- themes
	"bluz71/vim-moonfly-colors",

	-- lsp
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/nvim-cmp",
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	"saadparwaiz1/cmp_luasnip",
	"nvim-tree/nvim-tree.lua",
	"nvim-lualine/lualine.nvim",
	"windwp/nvim-autopairs",
	"lewis6991/gitsigns.nvim",
	"nvim-telescope/telescope.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"numToStr/Comment.nvim",
	"stevearc/conform.nvim",
	{'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async'},
}

local opts = {}

require("lazy").setup(plugins,opts)