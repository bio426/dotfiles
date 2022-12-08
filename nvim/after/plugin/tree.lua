local p = require("nvim-tree")

p.setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
		side = "right"
	},
	renderer = {
		group_empty = true,
		indent_markers = {
			enable = true
		}
	},
	filters = {
		dotfiles = false,
	},
})
