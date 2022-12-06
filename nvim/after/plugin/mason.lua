local p = require("mason")
local mlspcfg = require("mason-lspconfig")

p.setup()
mlspcfg.setup({
	ensure_installed = { "sumneko_lua", "denols" }
})
