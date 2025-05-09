return {
    "vim-airline/vim-airline",
    -- "VeryLazy" only when open a file from cmdline, "BufCreate" when open file from LazyVim snacks.dashboard
    event = vim.fn.argc(-1) > 0 and { "VeryLazy" } or { "BufCreate" },
    init = function()
        -- set an empty statusline/tabline till airline loads
        vim.o.statusline = " "
        vim.o.showtabline = 2

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
    config = function() 
        -- ensure a global statusline
        vim.o.laststatus = 3
    end,
    dependencies = {
        "vim-airline/vim-airline-themes",   -- Airline themes

        "tpope/vim-fugitive",     -- Git branch info
        "airblade/vim-gitgutter", -- Git diff info (added/changed/removed lines)
    },
}
