return {
    "bluz71/vim-moonfly-colors",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        vim.opt.termguicolors = true
        vim.opt.background = "dark"
        vim.cmd("colorscheme moonfly")
    end,
}
