-- ~/.config/nvim/lua/plugins/conform.lua
return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					rust = { "rustfmt" },
					python = { "black" },
					lua = { "stylua" },
					latex = { "latexindent" },
					cpp = { "clang_format" },
				},
				linters_by_ft = {
					-- Linters by filetype
					rust = { "cargo_clippy" },
					python = { "flake8" },
					lua = { "luacheck" },
					latex = { "chktex" },
					-- Add more as needed
				},
				format_on_save = {
					-- Enable format on save globally
					enabled = true,
					-- You can also specify pattern matching or exclusions
					allow_filetypes = { "*" },
				},
			})

			-- Optional: map a keybinding to format manually
			vim.keymap.set("n", "<leader>f", function()
				conform.format({ async = true })
			end, { noremap = true, silent = true })
		end,
	},
}
