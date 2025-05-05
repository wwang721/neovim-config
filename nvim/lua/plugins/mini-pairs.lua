return {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    opts = {
        -- These are the default settings in LazyVim
        modes = { insert = true, command = true, terminal = false },
        skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
        skip_ts = { "string" },
        skip_unbalanced = true,
        markdown = true,
    },
    config = function(_, opts)
        require("mini.pairs").setup(opts)
    end,
}
