local mapKeys = require("utils").mapKeys
local builtin = require("telescope.builtin")

vim.g.mapleader = " "

mapKeys("n", "<Leader>e", ":NvimTreeToggle<CR>")
mapKeys("n", "<Leader>f", "<ESC><cmd>lua vim.lsp.buf.format({async = true})<CR>")
mapKeys("n", "<Leader>k", ":BufferLineCycleNext<CR>")
mapKeys("n", "<Leader>j", ":BufferLineCyclePrev<CR>")

mapKeys("n", "<C-e>", "3<C-e>") -- scroll down more quickly
mapKeys("n", "<C-y>", "3<C-y>") -- scroll up more quickly

mapKeys("n", "<Leader>fe", builtin.find_files) -- search files
mapKeys("n", "<Leader>ff", builtin.current_buffer_fuzzy_find) -- search in current buffer
mapKeys("n", "<Leader>fa", builtin.live_grep) -- search all
