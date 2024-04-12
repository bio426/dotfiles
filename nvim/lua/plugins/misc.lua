--- @type LazySpec
return {
    { "echasnovski/mini.pairs",      opts = {} },
    {
        "echasnovski/mini.comment",
        dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
        opts = {
            options = {
                custom_commentstring = function()
                    return require("ts_context_commentstring.internal").calculate_commentstring()
                        or vim.bo.commentstring
                end,
            },
        },
    },
    { "echasnovski/mini.statusline", opts = {} },
}
