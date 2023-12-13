local lsp = require("lsp-zero")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
lsp.preset("recommended")

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {},
  handlers = {
    lsp.default_setup,
  },
})

local nvim_lsp = require("lspconfig")
nvim_lsp.clangd.setup {
  cmd = { "/opt/homebrew/opt/llvm/bin/clangd", "--background-index" },
  root_dir = nvim_lsp.util.root_pattern("compile_commands.json", ".clangd"),
}
