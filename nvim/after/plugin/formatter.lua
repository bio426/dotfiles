local p = require("formatter")
local util = require("formatter.util")

print(vim.fn.stdpath "data", "mason" )

p.setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		go = {
			require("formatter.filetypes.go").gofmt,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettier,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
