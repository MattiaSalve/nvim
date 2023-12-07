local lsp_zero = require("lsp-zero")

lsp_zero.preset("recommended")

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require("mason").setup({})
require("mason-lspconfig").setup({
  handlers = {  lsp_zero.default_setup, }
})

require("mason-null-ls").setup({
  handlers = {},
})

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

local lsp_format_on_save = function(bufnr)
  vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = augroup,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format()
    end,
  })
end

lsp_zero.on_attach(function(client, bufnr)
  lsp_format_on_save(bufnr)
end)

lsp_zero.setup()
