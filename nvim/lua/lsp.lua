local lspconf = require("lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")

lspconf.util.default_config = vim.tbl_deep_extend(
	"force",
	lspconf.util.default_config,
	{
		flags = {
			debounce_text_changes = 150,
		},
		capabilities = cmp_lsp.default_capabilities(
			vim.lsp.protocol.make_client_capabilities()
		),
		on_attach = function(client, bufnr)
			vim.api.nvim_exec_autocmds("User", { pattern = "LspAttached" })
		end
	}
)

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

lspconf.denols.setup({
	on_attach = function(client, bufnr)
		lspconf.util.default_config.on_attach(client, bufnr)
	end,
	root_dir = lspconf.util.root_pattern("deno.json")
})

lspconf.gopls.setup({
	on_attach = function(client, bufnr)
		lspconf.util.default_config.on_attach(client, bufnr)
	end,
	root_dir = lspconf.util.root_pattern("go.mod"),
})

lspconf.volar.setup({
	on_attach = function(client, bufnr)
		lspconf.util.default_config.on_attach(client, bufnr)
	end,
	root_dir = lspconf.util.root_pattern("vite.config.ts")
})
