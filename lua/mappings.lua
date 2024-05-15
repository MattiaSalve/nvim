local g = vim.g
local set = vim.keymap.set

g.mapleader = ' '
set('n', '<leader>e', vim.cmd.NvimTreeToggle)

set('n', '<C-h>', '<C-w>h')
set('n', '<C-l>', '<C-w>l')
set('n', '<C-j>', '<C-w>j')
set('n', '<C-k>', '<C-w>k')

set('n', 'm', '<C-d>')
set('n', ',', '<C-u>')
set('n', 'M', 'm')

set('t', '<C-t>', '<C-\\><C-n>:FloatermToggle<CR>')

set('n', '<leader>te', vim.cmd.FloatermToggle, { desc = 'Floating terminal window' })
set('n', '<leader>th', vim.cmd.Theme, { desc = 'Theme switcher' })

set('n', '<leader>p', ':Copilot panel<CR>', { desc = 'Show copilot panel' })
