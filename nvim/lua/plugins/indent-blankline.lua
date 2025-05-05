return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        indent = {
            char = "│",
        },
        scope = {
            enabled = false,
        },
    },
    config = function(_, opts)
        -- Enable `listchars` globally for space display
        vim.opt.list = true
        vim.opt.listchars = {
            space = "·",
            tab = "→ ",
            trail = "·",
            extends = "›",
            precedes = "‹",
        }
        -- Setup ibl
        require("ibl").setup(opts)
    end,
}
