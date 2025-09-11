local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- General
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>h", ":nohlsearch<CR>", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- Ensure Esc works in insert mode
vim.keymap.set("i", "<Esc>", "<Esc>", { noremap = true })

-- Show diagnostics in a floating window with <leader>l
vim.keymap.set("n", "<leader>l", function()
	vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
end, { desc = "Show line diagnostics" })
