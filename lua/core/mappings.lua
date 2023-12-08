local set = vim.keymap.set

vim.g.mapleader = " "
set("n", "<leader>e", vim.cmd.NvimTreeToggle)

set("n", "<C-h>", "<C-w>h")
set("n", "<C-j>", "<C-w>j")
set("n", "<C-k>", "<C-w>k")
set("n", "<C-l>", "<C-w>l")

vim.cmd [[ command! Format execute "lua vim.lsp.buf.format()" ]]
set("n", "<leader>fo", ":Format<CR>")
