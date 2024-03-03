local g = vim.g

filetype,
plugin,
on,
g.vimtex_compiler_method = "latexrun"

g.vimtex_quickfix_ignore_filters = { "Underfull", "Overfull" }
