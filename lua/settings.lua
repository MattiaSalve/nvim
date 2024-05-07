local opt = vim.opt
local g = vim.g

opt.relativenumber = true
opt.number = true
opt.foldexpr = "vimtex#fold#level(v:lnum)"
opt.foldmethod = "expr"
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.termguicolors = true
opt.foldlevel = 1
opt.foldlevelstart = 99
opt.foldenable = true
opt.colorcolumn = "90"

vim.cmd [[set clipboard+=unnamedplus]]

g.tex_flavor = "latex"
