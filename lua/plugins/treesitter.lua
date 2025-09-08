-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"bash",
				"python",
				"rust",
				"toml",
				"json",
				"yaml",
				"markdown",
				"markdown_inline",
				"latex",
				"bibtex",
			},
			highlight = { enable = true },
			indent = { enable = true },
			auto_install = true,
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
