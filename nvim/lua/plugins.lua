vim.cmd("packadd packer.nvim")

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	--required
	use("nvim-lua/plenary.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("nvim-treesitter/nvim-treesitter")

	-- themes
	use("bluz71/vim-moonfly-colors")

	-- lsp
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")

	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp")
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	use("saadparwaiz1/cmp_luasnip")

	use("nvim-tree/nvim-tree.lua")
	use("nvim-lualine/lualine.nvim")
	use("windwp/nvim-autopairs")
	use("lewis6991/gitsigns.nvim")
	use("nvim-telescope/telescope.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("numToStr/Comment.nvim")
	use("mhartington/formatter.nvim")
	use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
end
)
