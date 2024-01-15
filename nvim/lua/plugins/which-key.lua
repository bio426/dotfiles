--- @type LazySpec
return {
	{
		"folke/which-key.nvim",
		config = function()
			local wk = require("which-key")
			wk.setup()
			wk.register({
				["<leader>"] = {
					c = { name = "Code" },
					s = { name = "Search" },
					g = { name = "Git" },
				},
			})
		end,
	},
}
