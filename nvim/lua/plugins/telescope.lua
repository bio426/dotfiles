--- @type LazySpec
return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            enabled = vim.fn.executable("make") == 1,
            config = function()
                require("telescope").load_extension("fzf")
            end,
        },
    },
    opts = {
        defaults = {
            mappings = {
                i = {
                    ["<C-u>"] = false,
                    ["<C-d>"] = false,
                },
            },
            file_ignore_patterns = { "node_modules", "ui" },
        },
    },
    keys = {
        { "<leader>,",       "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Recent Buffers" },
        { "<leader>/",       "<cmd>Telescope live_grep<cr>",                                desc = "Grep" },
        { "<leader>:",       "<cmd>Telescope command_history<cr>",                          desc = "Command History" },
        { "<leader><space>", "<cmd>Telescope find_files<cr>",                               desc = "Find Files" },
        -- git
        { "<leader>gc",      "<cmd>Telescope git_commits<CR>",                              desc = "commits" },
        { "<leader>gs",      "<cmd>Telescope git_status<CR>",                               desc = "status" },
        { "<leader>sd",      "<cmd>Telescope diagnostics<cr>",                              desc = "Search Diagnostics" },
        -- search
        { "<leader>sb",      "<cmd>Telescope current_buffer_fuzzy_find<cr>",                desc = "Buffer" },
        { "<leader>sd",      "<cmd>Telescope diagnostics bufnr=0<cr>",                      desc = "Document diagnostics" },
        { "<leader>sD",      "<cmd>Telescope diagnostics<cr>",                              desc = "Workspace diagnostics" },
    },
}
