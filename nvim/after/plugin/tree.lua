local p = require("nvim-tree")

p.setup({
	hijack_cursor = true,
	view = {
		side = "right"
	},
	renderer = {
		indent_markers = {
			enable = true
		}
	},
	filters = {
		custom = { ".git" },
		exclude = { ".gitignore", ".env" }
	}
})
