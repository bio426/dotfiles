local p = require("conform")

p.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		typescript = { "prettier" },
		vue = { "prettier" },
	},
})
