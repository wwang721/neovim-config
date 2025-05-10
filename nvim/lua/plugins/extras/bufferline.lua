return {
    "akinsho/bufferline.nvim",
    -- "VeryLazy" only when open a file from cmdline, "BufCreate" when open file from LazyVim snacks.dashboard
    event = vim.fn.argc(-1) > 0 and { "VeryLazy" } or { "BufCreate" },
    opts = {
        options = {
            -- stylua: ignore
            close_command = function(n) Snacks.bufdelete(n) end,
            -- stylua: ignore
            right_mouse_command = function(n) Snacks.bufdelete(n) end,
            diagnostics = "nvim_lsp",
            always_show_bufferline = true,
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "EXPLORER",
                    highlight = "Directory",
                    text_align = "left",
                },
                {
                    filetype = "snacks_layout_box",
                },
            },
            ---@param opts bufferline.IconFetcherOpts
        },
    },
    config = function(_, opts)
        require("bufferline").setup(opts)
            -- Fix bufferline when restoring a session
            vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
            callback = function()
                vim.schedule(function()
                    pcall(nvim_bufferline)
                end)
            end,
        })
    end,
}
