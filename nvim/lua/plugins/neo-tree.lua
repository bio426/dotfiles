--- @type LazySpec
return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		cmd = "Neotree",
		opts = {
			sources = { "filesystem", "buffers", "git_status", "document_symbols" },
			window = { position = "right" },
			filesystem = {
				follow_current_file = { enabled = true },
				filtered_items = { hide_dotfiles = false, hide_by_name = { "node_modules", ".git" } },
				use_libuv_file_watcher = true,
				hijack_netrw_behavior = "open_default",
			},
		},
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toogle File Explorer" },
		},
		init = function()
			if vim.fn.argc(-1) == 1 then
				local stat = vim.loop.fs_stat(tostring(vim.fn.argv(0)))
				if stat and stat.type == "directory" then
					require("neo-tree")
				end
			end
		end,
	},
}
