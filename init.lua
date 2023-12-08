vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require "core"
require "core.mappings"
require "core.autocmds"
require "core.options"
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})
