-- ~/.config/nvim/lua/plugins/nvim-tree.lua
return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- for file icons
		},
		config = function()
			require("nvim-tree").setup({
				-- example: ignoring build artifacts
				filters = {
					custom = {
						"^build$",
						"%.aux$",
						"%.bbl$",
						"%.blg$",
						"%.fdb_latexmk$",
						"%.fls$",
						"%.log$",
						"%.out$",
						"%.synctex.gz$",
					},
				},

				view = {
					width = 30,
					side = "left",
					-- auto_resize = true,
					-- mappings = {
					-- list = {
					-- { key = { "l", "<CR>", "o" }, action = "edit" },
					-- { key = "h", action = "close_node" },
					-- { key = "v", action = "vsplit" },
					-- },
					-- },
				},
				git = {
					enable = true,
					ignore = false,
				},
				renderer = {
					icons = {
						show = {
							git = true,
							folder = true,
							file = true,
							folder_arrow = true,
						},
					},
				},
			})

			-- Toggle nvim-tree with <leader>e
			vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
		end,
	},
}
