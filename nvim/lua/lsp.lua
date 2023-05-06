local lspconfig = require("lspconfig")
local lsp_defaults = lspconfig.util.default_config
local cmp_lsp = require("cmp_nvim_lsp")
local mapKeys = require("utils").mapKeys

lsp_defaults.capabilities = vim.tbl_deep_extend(
		"force",
		lsp_defaults.capabilities,
		cmp_lsp.default_capabilities()
	)

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false }
		}
	},
	root_dir = lspconfig.util.root_pattern("init.lua")
})
lspconfig.gopls.setup({
	root_dir = lspconfig.util.root_pattern("go.mod"),
})
lspconfig.tsserver.setup({
	root_dir = lspconfig.util.root_pattern("tsconfig.json"),
})
lspconfig.volar.setup({
	root_dir = lspconfig.util.root_pattern("vite.config.ts"),
})
lspconfig.tailwindcss.setup({
	root_dir = lspconfig.util.root_pattern("tailwind.config.cjs"),
})
lspconfig.clangd.setup({
	-- root_dir = lspconfig.util.root_pattern("go.mod"),
})
lspconfig.zls.setup({
	-- root_dir = lspconfig.util.root_pattern("go.mod"),
})

vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function()
		-- lsp mappings
		local opts = { buffer = true }
		-- Muestra información sobre símbolo debajo del cursor
		mapKeys("n", "<S-k>", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)

		-- Saltar a definición
		mapKeys("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)

		-- Saltar a declaración
		mapKeys("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)

		-- Mostrar implementaciones
		mapKeys("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)

		-- Saltar a definición de tipo
		mapKeys("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)

		-- Listar referencias
		mapKeys("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)

		-- Mostrar argumentos de función
		mapKeys("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)

		-- Renombrar símbolo
		mapKeys("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)

		-- Listar "code actions" disponibles en la posición del cursor
		mapKeys("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		mapKeys("x", "<F4>", "<cmd>lua vim.lsp.buf.range_code_action()<cr>", opts)

		-- Mostrar diagnósticos de la línea actual
		mapKeys("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
	end
})
