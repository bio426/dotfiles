local p = require("nvim-treesitter.configs")

p.setup({
	ensure_installed = { "lua", "go", "typescript" },
	highlight = {
		enable = true
	},
})
