local p = require("nvim-treesitter.configs")

p.setup({
	ensure_installed = { "lua", "go", "python" },
	highlight = {
		enable = true
	},
})
