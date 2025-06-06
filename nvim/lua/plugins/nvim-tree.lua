return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- optional for file icons
    },
    config = function()
        require("nvim-tree").setup({
            -- your settings here (optional)
            view = {
                width = 30,
                side = "left",
            },
            renderer = {
                indent_markers = {
                    enable = true, -- This enables the │ ├ └ lines
                    icons = {
                        corner = "└",
                        edge   = "│",
                        item   = "├",
                        bottom = "─",
                        none   = " ",
                    },
                },
                icons = {
                    web_devicons = {
                        file = {
                            enable = true,
                            color = true,
                        },
                        folder = {
                            enable = false,
                            color = true,
                        },
                    },
                    show = {
                        git = true,
                        folder = true,
                        folder_arrow = false,
                        file = true,
                    },
                    glyphs = {
                        git = { deleted = "", } -- Windows Terminal somehow can't show the default icon normally
                    }
                },
            },
            filters = {
                dotfiles = false,
            },
        })
    end,
    keys = { { "<F2>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle File Tree" } },
    -- lazy = false,  -- load on startup
}
