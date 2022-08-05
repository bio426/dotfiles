require("plugins")
require("options")
require("mappings")

require("impatient")

require("luasnip.loaders.from_vscode").lazy_load()

local li = require "nvim-lsp-installer"
li.setup {}

local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end
	},
	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp', keyword_length = 2 },
		{ name = 'buffer', keyword_length = 4 },
		{ name = 'luasnip', keyword_length = 3 },
		{ name = 'nvim_lsp_signature_help' }
	}
})

local nvim_lsp = require("lspconfig")

nvim_lsp.tsserver.setup {
	on_attach = on_attach,
	root_dir = nvim_lsp.util.root_pattern("tsconfig.json"),
}

nvim_lsp.gopls.setup {
	on_attach = on_attach,
	root_dir = nvim_lsp.util.root_pattern("go.mod"),
}

nvim_lsp.sumneko_lua.setup {
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }
			}
		}
	},
	root_dir = nvim_lsp.util.root_pattern("init.lua")
}

nvim_lsp.volar.setup {
	on_attach = on_attach,
}

nvim_lsp.tailwindcss.setup {
	on_attach = on_attach,
	root_dir = nvim_lsp.util.root_pattern("tailwind.config.js"),
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

vim.cmd [[colorscheme tokyonight]]
