return {
    "stevearc/aerial.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        backends = { "lsp", "treesitter", "markdown", "man" },
        -- attach_mode = "global",  -- this makes Aerial global (shared across windows) instead of one outline per window
        layout = {
            resize_to_content = false,
            win_opts = {
                winhighlight = "Normal:Normal,NormalNC:Normal,SignColumn:Normal",
                signcolumn = "yes",
            },
            min_width = 30, -- minimum width in columns
            max_width = 30, -- maximum width in columns
        },
        show_guides = true,
        guides = {
            mid_item = "├╴",
            last_item = "└╴",
            nested_top = "│ ",
            whitespace = "  ",
        },
    },
    keys = { { "<F3>", "<cmd>AerialToggle<CR>", desc = "Toggle Aerial Outline" } },
}
