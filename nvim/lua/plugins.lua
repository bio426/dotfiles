-- startup and add configure plugins
vim.cmd("packadd packer.nvim")
return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use "lewis6991/impatient.nvim"
	use "kyazdani42/nvim-web-devicons"
	use("nvim-treesitter/nvim-treesitter")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("hrsh7th/nvim-cmp")
	use("L3MON4D3/LuaSnip")
	use "rafamadriz/friendly-snippets"
	use("saadparwaiz1/cmp_luasnip")
	use("williamboman/nvim-lsp-installer")
	use "goolord/alpha-nvim"
	use "nvim-lualine/lualine.nvim"
	use "folke/tokyonight.nvim"
	use "windwp/nvim-autopairs"
	use "kyazdani42/nvim-tree.lua"
	use "lewis6991/gitsigns.nvim"
end
)
