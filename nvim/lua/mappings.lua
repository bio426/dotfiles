local mapKeys = require("utils").mapKeys

vim.g.mapleader = " "

mapKeys("n", "<Leader>e", ":NvimTreeToggle<CR>")
mapKeys("n", "<Leader>f", "<ESC><cmd>lua vim.lsp.buf.format({async = true})<CR>")
mapKeys("n", "<Leader>k", ":BufferLineCycleNext<CR>")
mapKeys("n", "<Leader>j", ":BufferLineCyclePrev<CR>")

mapKeys("n", "<C-e>", "3<C-e>") -- scroll down more quickly
mapKeys("n", "<C-y>", "3<C-y>") -- scroll up more quickly

mapKeys("n", "<Leader>sf", ":Telescope live_grep<CR>") -- search files
mapKeys("n", "<Leader>sb", ":Telescope current_buffer_fuzzy_find<CR>") -- search in current buffer

-- lsp mappings
local opts = { buffer = true }
-- Muestra información sobre símbolo debajo del cursor
mapKeys("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)

-- Saltar a definición
mapKeys("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)

-- Saltar a declaración
mapKeys("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)

-- Mostrar implementaciones
mapKeys("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)

-- Saltar a definición de tipo
mapKeys("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)

-- Listar referencias
mapKeys("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)

-- Mostrar argumentos de función
mapKeys("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)

-- Renombrar símbolo
mapKeys("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)

-- Listar "code actions" disponibles en la posición del cursor
mapKeys("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
mapKeys("x", "<F4>", "<cmd>lua vim.lsp.buf.range_code_action()<cr>", opts)

-- Mostrar diagnósticos de la línea actual
mapKeys("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)

-- Saltar al diagnóstico anterior
mapKeys("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)

-- Saltar al siguiente diagnóstico
mapKeys("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
