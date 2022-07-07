local mapKeys = require("utils").mapKeys

vim.cmd [[map <Up> <Nop>]]
vim.cmd [[map <Left> <Nop>]]
vim.cmd [[map <Right> <Nop>]]
vim.cmd [[map <Down> <Nop>]]

mapKeys("n", "<Leader>e", ":NvimTreeToggle<CR>")
mapKeys("n", "<Leader>f", "<ESC><cmd>lua vim.lsp.buf.formatting()<CR>")
mapKeys("n", "<Leader>h", "<ESC><cmd>lua vim.lsp.buf.hover()<CR>")
