-- Hide deprecation warnings
vim.g.deprecation_warnings = false

-- Snacks animations
-- Set to `false` to globally disable all snacks animations
vim.g.snacks_animate = true

local opt = vim.opt

opt.showmode = false -- hide mode messages in the left-bottom corner since we have a statusline
opt.showcmd = true  -- show partial key sequences in the bottom-right corner

opt.ruler = false -- Disable the default ruler
opt.laststatus = 3 -- global statusline
opt.mouse = "a" -- Enable mouse mode

opt.scrolloff = 4 -- Lines of context
opt.sidescrolloff = 8 -- Columns of context

opt.number = true -- Print line number
opt.cursorline = true -- Enable highlighting of the current line
-- opt.termguicolors = true -- True color support

-- opt.guicursor = "" -- disable cursor shape changes
opt.guicursor = {
    "n-v-sm:block",      -- block cursor in normal, visual, and select mode
    "i-c-ci-ve:ver25",       -- vertical bar (25%) in insert, command-line, and related modes
    "r-cr-o:hor20"         -- horizontal bar (20%) in replace and operator-pending modes
}

opt.tabstop = 4 -- Number of spaces tabs count for
opt.softtabstop = 4 -- Number of spaces that a <Tab> counts for while editing
opt.shiftround = true -- Round indent
opt.shiftwidth = 4 -- Size of an indent
opt.expandtab = true -- Use spaces instead of tabs

opt.wrap = false -- Disable line wrap
opt.linebreak = true -- Wrap lines at convenient points, only applies when wrap is enabled.

-- opt.fillchars:append({ eob = ' ' }) -- Replace ~ on empty lines after the end of buffer with spaces
-- Customize fill characters for the UI
opt.fillchars = {
    foldopen = "",
    foldclose = "",
    fold = " ",
    foldsep = " ",
    diff = "╱",
    eob = " ",
}

-- Enable `listchars` globally for space display
opt.list = true 
opt.listchars = {
    space = "·",
    tab = "→ ",
    trail = "·",
    extends = "›",
    precedes = "‹",
}

opt.foldlevel = 99 -- ensures folds are open by default
if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
  opt.foldexpr = "v:lua.require'util.ui'.foldexpr()"
  opt.foldmethod = "expr"
  opt.foldtext = ""
else
  opt.foldmethod = "indent"
  opt.foldtext = "v:lua.require'util.ui'.foldtext()"
end

-- Turn off diagnostics completely (I don't want to see any errors)
vim.diagnostic.config({ virtual_text = false, signs = false, underline = false })

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

vim.cmd("colorscheme molokai")

