local p = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

p.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	},
	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp', keyword_length = 2, priority = 10 },
		{ name = 'buffer', keyword_length = 3 },
		{ name = 'luasnip', keyword_length = 3, priority = 9 },
	},
	window = {
		documentation = p.config.window.bordered()
	},
	formatting = {
		fields = { "menu", "abbr", "kind" },
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = 'λ',
				luasnip = '⋗',
				buffer = 'Ω',
				path = '🖫',
			}

			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
	mapping = {
		['<Up>'] = p.mapping.select_prev_item(selectOpts),
		['<Down>'] = p.mapping.select_next_item(selectOpts),
		['<C-u>'] = p.mapping.scroll_docs(-4),
		['<C-f>'] = p.mapping.scroll_docs(4),
		['<C-e>'] = p.mapping.abort(),
		['<CR>'] = p.mapping.confirm({ select = true }),
		['<C-d>'] = p.mapping(function(fallback)
			if luasnip.jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<C-b>'] = p.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<Tab>'] = p.mapping(function(fallback)
			local col = vim.fn.col('.') - 1

			if p.visible() then
				p.select_next_item(selectOpts)
			elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
				fallback()
			else
				p.complete()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = p.mapping(function(fallback)
			if p.visible() then
				p.select_prev_item(selectOpts)
			else
				fallback()
			end
		end, { 'i', 's' }),
	}
})
