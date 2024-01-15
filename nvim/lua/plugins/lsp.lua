-- LSP Configuration & Plugins
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/neodev.nvim",
		},
		config = function()
			-- Set up Mason before anything else
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" },
				automatic_installation = true,
			})

			-- Neodev setup before LSP config
			require("neodev").setup()

			-- Set up cool signs for diagnostics
			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- Diagnostic config
			local config = {
				virtual_text = false,
				signs = {
					active = signs,
				},
				update_in_insert = true,
				underline = true,
				severity_sort = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			}
			vim.diagnostic.config(config)

			-- This function gets run when an LSP connects to a particular buffer.
			local on_attach = function(_, bufnr)
				local lsp_map = function(lhs, rhs, b, desc)
					vim.keymap.set("n", lhs, rhs, { silent = true, buffer = b, desc = desc })
				end

				lsp_map("gd", function()
					require("telescope.builtin").lsp_definitions({ reuse_win = true })
				end, bufnr, "Goto Definition")
				lsp_map("gr", require("telescope.builtin").lsp_references, bufnr, "Goto References")
				lsp_map("gD", vim.lsp.buf.declaration, bufnr, "Goto Declaration")
				lsp_map("gI", function()
					require("telescope.builtin").lsp_implementations({ reuse_win = true })
				end, bufnr, "Goto Implementation")
				lsp_map("gY", function()
					require("telescope.builtin").lsp_type_definitions({ reuse_win = true })
				end, bufnr, "Goto Type Definition")
				lsp_map("K", vim.lsp.buf.hover, bufnr, "Hover Documentation")
				lsp_map("gK", vim.lsp.buf.signature_help, bufnr, "Signature Help")
				lsp_map("<leader>ca", vim.lsp.buf.code_action, bufnr, "Code action")
				lsp_map("<leader>cA", function()
					vim.lsp.buf.code_action({
						context = {
							only = {
								"source",
							},
							diagnostics = {},
						},
					})
				end, bufnr, "Source action")
				lsp_map("<leader>cr", vim.lsp.buf.rename, bufnr, "Rename symbol")

				vim.diagnostic.config({
					severity_sort = true,
					float = { source = "if_many" },
				})

				lsp_map("cd", vim.diagnostic.open_float, bufnr, "Line diagnostics")
				lsp_map("]d", vim.diagnostic.goto_next, bufnr, "Next diagnostics")
				lsp_map("[d", vim.diagnostic.goto_prev, bufnr, "Prev diagnostics")
			end

			-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			local servers = {
				lua_ls = {
					Lua = {
						completion = { callSnippet = "Replace" },
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
				volar = { filetypes = { "typescript", "javascript", "vue" } },
				gopls = {},
				zls = {},
				tailwindcss = {},
			}

			-- Ensure the servers above are installed
			local mason_lspconfig = require("mason-lspconfig")

			mason_lspconfig.setup({
				ensure_installed = vim.tbl_keys(servers),
			})

			mason_lspconfig.setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						on_attach = on_attach,
						settings = servers[server_name],
						filetypes = (servers[server_name] or {}).filetypes,
					})
				end,
			})
		end,
	},
}
