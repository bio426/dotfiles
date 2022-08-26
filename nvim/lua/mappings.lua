local mapKeys = require("utils").mapKeys

vim.g.mapleader = " "

-- Disable mouse
vim.cmd [[map <Up> <Nop>]]
vim.cmd [[map <Left> <Nop>]]
vim.cmd [[map <Right> <Nop>]]
vim.cmd [[map <Down> <Nop>]]
vim.cmd [[imap <Up> <Nop>]]
vim.cmd [[imap <Left> <Nop>]]
vim.cmd [[imap <Right> <Nop>]]
vim.cmd [[imap <Down> <Nop>]]

vim.cmd [[imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' ]]

mapKeys("n", "<Leader>e", ":NvimTreeToggle<CR>")
mapKeys("n", "<Leader>f", "<ESC><cmd>lua vim.lsp.buf.formatting()<CR>")
mapKeys("n", "<Leader>k", ":BufferLineCycleNext<CR>")
mapKeys("n", "<Leader>j", ":BufferLineCyclePrev<CR>")

--mapKeys("n", "<Down>", [["pdd"pp]]) -- move line down
--mapKeys("n", "<Up>", [["pddk"pP]]) -- move line up
mapKeys("n", "<C-e>", "3<C-e>") -- scroll down more quickly
mapKeys("n", "<C-y>", "3<C-y>") -- scroll up more quickly
mapKeys("n", "<Leader>bd", ":bp | bd #<CR>") -- delete the current buffer

mapKeys("n", "<Leader>sf", ":Telescope live_grep<CR>") -- search files
mapKeys("n", "<Leader>sb", ":Telescope current_buffer_fuzzy_find<CR>") -- search in current buffer
