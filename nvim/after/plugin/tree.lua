local p = require("nvim-tree")

p.setup({
	hijack_cursor = true,
	renderer = {
		indent_markers = {
			enable = true
		}
	},
	filters = {
		custom = { "^\\.git" }
	}
})
