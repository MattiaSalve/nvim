local ac = vim.api.nvim_create_autocmd
local ag = vim.api.nvim_create_augroup

ag("LspFormatting", { clear = true })
ac("BufWritePre", {
  pattern = "*",
  group = "LspFormatting",
  command = "Format"
})
