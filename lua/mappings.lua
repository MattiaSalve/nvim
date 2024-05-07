local g = vim.g
local set = vim.keymap.set

g.mapleader = " "
set("n", "<leader>e", vim.cmd.NvimTreeToggle)

set("n", "<C-h>", "<C-w>h")
set("n", "<C-l>", "<C-w>l")
set("n", "<C-j>", "<C-w>j")
set("n", "<C-k>", "<C-w>k")

set("n", "<leader>t", vim.cmd.FloatermNew)
