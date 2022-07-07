-- startup and add configure plugins
vim.cmd("packadd packer.nvim")
return require("packer").startup(function()
  use("wbthomason/packer.nvim")
 
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
	use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
	}
	use({"nvim-lualine/lualine.nvim",
	config = function()
		require "lualine".setup{
			options = {
				theme= "tokyonight"
			}
		}
	end
	})
	use 'folke/tokyonight.nvim'
	use {
		"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
	}
	use {
  	'kyazdani42/nvim-tree.lua',
  	requires = {
    	'kyazdani42/nvim-web-devicons',
  	}
	}
	use {
  	'lewis6991/gitsigns.nvim',
  	config = function()
    	require('gitsigns').setup()
  	end
	}
  end
)

