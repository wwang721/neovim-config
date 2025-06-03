-- Replace Neovim's default CTRL-I/<Tab> function:
--     Go to [count] newer cursor position in jump list
vim.keymap.set("n", "<C-j>", "<C-i>", { noremap = true, silent = true })
