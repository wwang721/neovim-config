return {
    "loctvl842/monokai-pro.nvim",
    -- https://github.com/loctvl842/monokai-pro.nvim
    lazy = false,
    config = function()
        require("monokai-pro").setup({
            transparent_background = false,
            devicons = true, -- highlight the icons of "nvim-web-devicons"
            styles = {
                comment = { italic = true },
                keyword = { italic = true },
                type = { italic = true },
                storageclass = { italic = true },
                structure = { italic = true },
                parameter = { italic = true },
                annotation = { italic = true },
                tag_attribute = { italic = true },
            },
            filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
            inc_search = "background", -- underline | background
            background_clear = {
                "float_win", -- for ""nvim-cmp"" border, see their website, also need to modify `cmp.lua`
                "nvim-tree",
                "neo-tree",
                "toggleterm",
                "telescope",
                "renamer",
                "notify",
                "bufferline",
            }, -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
        })
        
        vim.cmd([[colorscheme monokai-pro]]) -- apply the colorscheme

        vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#555555", nocombine = true }) -- fix the indent guide color used by
        vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ffffff", bg = "NONE" }) -- make the vertical/horizontal split lines visibly white
        vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = "#ffffff", bg = "NONE" }) -- make the "nvim-tree" split lines visibly white
        vim.api.nvim_set_hl(0, "Visual", { bg = "#555555" })  -- set the selection background gray

        vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#E6DB74" }) -- restore Monokai-style yellow coloring to folder icons
        vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#E6DB74" }) -- give folder names the same yellow as icons

        vim.api.nvim_set_hl(0, "NvimTreeRootFolder", { fg = "#FD971F", bold = true })  -- orange root

    end,
}
