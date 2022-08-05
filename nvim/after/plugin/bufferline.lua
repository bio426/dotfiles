local p = require("bufferline")

p.setup({
	options = {
		diagnostics = "nvim-lsp",
		offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center" } },
		show_buffer_close_icons = false,
		show_close_icon = false
	}
})
