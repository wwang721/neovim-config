return {
    {
        "vim-airline/vim-airline",
        lazy = false,  -- load immediately; airline is a UI plugin
        init = function()
            -- Airline configuration
            vim.g.airline_theme = "molokai"
            vim.g.airline_powerline_fonts = 1
            vim.g["airline#extensions#tabline#enabled"] = 1
            vim.g["airline#extensions#tabline#formatter"] = "unique_tail"

            -- Clear the error and warning sections explicitly
            vim.g["airline_section_error"] = ""
        end,
    },
    {
        "vim-airline/vim-airline-themes",
        lazy = false,
    }
}
