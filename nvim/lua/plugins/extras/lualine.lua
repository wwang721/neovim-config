return {
    'nvim-lualine/lualine.nvim',
    -- "VeryLazy" only when open a file from cmdline, "BufCreate" when open file from LazyVim snacks.dashboard
    event = vim.fn.argc(-1) > 0 and { "VeryLazy" } or { "BufCreate", "InsertEnter" },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    init = function()
        vim.g.lualine_laststatus = vim.o.laststatus
        
        vim.o.showtabline = 2
        vim.o.statusline = " "
    end,
    config = function()
        vim.o.laststatus = vim.g.lualine_laststatus

        require("lualine").setup {
            options = {
                theme = "auto",
                globalstatus = vim.o.laststatus == 3,
                disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
            },

            sections = {

                lualine_y = {
                    { "progress", separator = " ", padding = { left = 1, right = 0 } },
                    { "location", padding = { left = 0, right = 1 } },
                },
                lualine_z = {
                    function()
                        return " " .. os.date("%R")
                    end,
                },
            }
        }
        
    end,
}
