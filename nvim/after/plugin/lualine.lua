local p = require("lualine")

p.setup({
	options = {
		theme = "auto",
		disabled_filetypes = { "packer", "NvimTree" }
	}
})
