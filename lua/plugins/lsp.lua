-- ~/.config/nvim/lua/plugins/lsp.lua
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- This list is now ONLY for servers managed by Mason.
		-- We have REMOVED 'basedpyright' from this list.
		local mason_servers = {
			"lua_ls",
			"rust_analyzer",
			"texlab",
			"clangd",
		}

		require("mason").setup({
			pip = {
				executables = {
					basedpyright = "basedpyright-langserver",
				},
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = mason_servers,
		})

		for _, server_name in ipairs(mason_servers) do
			vim.lsp.config(server_name, {
				capabilities = capabilities,
			})
		end
	end,
}
