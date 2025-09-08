-- ~/.config/nvim/lua/plugins/lsp.lua
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "rust_analyzer", "texlab", "clangd" },
				automatic_installation = true,
			})

			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							workspace = { checkThirdParty = false },
						},
					},
				},

				pyright = {},
				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {
							checkOnSave = { command = "clippy" },
						},
					},
				},

				texlab = {
					settings = {
						texlab = {
							build = {
								executable = "latexmk",
								args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
								onSave = false,
							},
							forwardSearch = {
								executable = "open",
								args = { "--synctex-forward", "%l:1:%f", "%p" },
							},
							chktex = { onEdit = false, onOpenAndSave = true },
						},
					},
				},
			}

			for server, config in pairs(servers) do
				config.capabilities = capabilities
				lspconfig[server].setup(config)
			end
		end,
	},
}
