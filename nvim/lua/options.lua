vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.wrap = false

vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- for themes
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd("colorscheme tokyonight")
-- vim.cmd("colorscheme everforest")

-- for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
