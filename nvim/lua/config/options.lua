-- Hide deprecation warnings
vim.g.deprecation_warnings = false

local opt = vim.opt

-- already shown in the statusline
opt.showmode = false -- hide mode messages in the left-bottom corner
opt.showcmd = false  -- hide partial key sequences in the bottom-right corner

opt.laststatus = 3 -- global statusline
opt.mouse = "a" -- Enable mouse mode

opt.number = true -- Print line number
opt.cursorline = true -- Enable highlighting of the current line
-- opt.termguicolors = true -- True color support

opt.guicursor = "" -- disable cursor shape changes

opt.tabstop = 4 -- Number of spaces tabs count for
opt.softtabstop = 4 -- Number of spaces that a <Tab> counts for while editing
opt.shiftwidth = 4 -- Size of an indent
opt.expandtab = true -- Use spaces instead of tabs

opt.wrap = false -- Disable line wrap
opt.linebreak = true -- Wrap lines at convenient points, only applies when wrap is enabled.

-- Turn off diagnostics completely (I don't want to see any errors)
vim.diagnostic.config({ virtual_text = false, signs = false, underline = false })

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- Replace ~ on empty lines after the end of buffer with spaces
vim.opt.fillchars:append({ eob = ' ' })

vim.cmd("colorscheme molokai")

