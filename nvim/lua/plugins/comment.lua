return {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
        require("Comment").setup()
    end,
    keys = {
        { "gcc", mode = "n", desc = "Toggle line comment" },
        { "gc",  mode = { "n", "v" }, desc = "Toggle line comment (line/block)" },
    },
}
