return {
    {
        "vim-airline/vim-airline",
        lazy = false,
        init = function()
            -- Airline UI config
            vim.g.airline_theme = "molokai"
            vim.g.airline_powerline_fonts = 1

            -- Enable tabline
            vim.g["airline#extensions#tabline#enabled"] = 1
            vim.g["airline#extensions#tabline#formatter"] = "unique_tail"

            -- Enable branch and hunk info (requires fugitive + gitgutter)
            vim.g["airline#extensions#branch#enabled"] = 1
            vim.g["airline#extensions#hunks#enabled"] = 1

            -- Optional: clear error section
            vim.g["airline_section_error"] = ""
        end,
        dependencies = {
            "tpope/vim-fugitive",     -- Git branch info
            "airblade/vim-gitgutter", -- Git diff info (added/changed/removed lines)
        },
    },
    {
        "vim-airline/vim-airline-themes",
        lazy = false,
    },
}
