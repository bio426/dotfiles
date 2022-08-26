require("plugins")
require("options")
require("mappings")
local utils = require("utils")

require("impatient")

local li = require "nvim-lsp-installer"
li.setup {}

vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require("cmp")
if (cmp == nil) then
	error("cmp is nil")
end
local luasnip = require("luasnip")
local selectOpts = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end
	},
	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp', keyword_length = 3, priority = 10 },
		{ name = 'buffer', keyword_length = 3 },
		{ name = 'luasnip', keyword_length = 2, priority = 9 },
	},
	window = {
		documentation = cmp.config.window.bordered()
	},
	formatting = {
		fields = { "menu", "abbr", "kind" },
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = 'λ',
				luasnip = '⋗',
				buffer = 'Ω',
				path = '🖫',
			}

			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
	mapping = {
		['<Up>'] = cmp.mapping.select_prev_item(selectOpts),
		['<Down>'] = cmp.mapping.select_next_item(selectOpts),
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<C-d>'] = cmp.mapping(function(fallback)
			if luasnip.jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<C-b>'] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<Tab>'] = cmp.mapping(function(fallback)
			local col = vim.fn.col('.') - 1

			if cmp.visible() then
				cmp.select_next_item(selectOpts)
			elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
				fallback()
			else
				cmp.complete()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item(selectOpts)
			else
				fallback()
			end
		end, { 'i', 's' }),
	}
})

require("luasnip.loaders.from_vscode").lazy_load()

local lsp_defaults = {
	flags = {
		debounce_text_changes = 150,
	},
	capabilities = require("cmp_nvim_lsp").update_capabilities(
		vim.lsp.protocol.make_client_capabilities()
	),
	on_attach = function(client, bufnr)
		vim.api.nvim_exec_autocmds("User", { pattern = "LspAttached" })
	end
}

local lspconf = require("lspconfig")

lspconf.util.default_config = vim.tbl_deep_extend(
	"force",
	lspconf.util.default_config,
	lsp_defaults
)

vim.api.nvim_create_autocmd("User", {
	pattern = "LspAttached",
	desc = "Acciones LSP",
	callback = function()
		local opts = { buffer = true }
		-- Muestra información sobre símbolo debajo del cursor
		utils.mapKeys("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)

		-- Saltar a definición
		utils.mapKeys("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)

		-- Saltar a declaración
		utils.mapKeys("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)

		-- Mostrar implementaciones
		utils.mapKeys("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)

		-- Saltar a definición de tipo
		utils.mapKeys("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)

		-- Listar referencias
		utils.mapKeys("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)

		-- Mostrar argumentos de función
		utils.mapKeys("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)

		-- Renombrar símbolo
		utils.mapKeys("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)

		-- Listar "code actions" disponibles en la posición del cursor
		utils.mapKeys("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		utils.mapKeys("x", "<F4>", "<cmd>lua vim.lsp.buf.range_code_action()<cr>", opts)

		-- Mostrar diagnósticos de la línea actual
		utils.mapKeys("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)

		-- Saltar al diagnóstico anterior
		utils.mapKeys("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)

		-- Saltar al siguiente diagnóstico
		utils.mapKeys("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
	end
})

lspconf.sumneko_lua.setup {
	on_attach = function(client, bufnr)
		lspconf.util.default_config.on_attach(client, bufnr)
	end,
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false }
		}
	},
	root_dir = lspconf.util.root_pattern("init.lua")
}

lspconf.gopls.setup {
	on_attach = function(client, bufnr)
		lspconf.util.default_config.on_attach(client, bufnr)
	end,
	capabilities = capabilities,
	root_dir = lspconf.util.root_pattern("go.mod"),
}

lspconf.tsserver.setup({
	on_attach = function(client, bufnr)
		lspconf.util.default_config.on_attach(client, bufnr)
	end,
	--root_dir = lspconf.util.root_pattern("tsconfig.json")
})

lspconf.volar.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

vim.cmd [[colorscheme tokyonight]]

local sign = function(opts)
	vim.fn.sign_define(opts.name, {
		texthl = opts.name,
		text = opts.text,
		numhl = ''
	})
end

sign({ name = 'DiagnosticSignError', text = '✘' })
sign({ name = 'DiagnosticSignWarn', text = '▲' })
sign({ name = 'DiagnosticSignHint', text = '⚑' })
sign({ name = 'DiagnosticSignInfo', text = '' })

vim.diagnostic.config({
	virtual_text = false,
	severity_sort = true,
	float = {
		header = '',
		prefix = '',
	},
})
