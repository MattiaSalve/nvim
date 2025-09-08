return {
	{
		"lervag/vimtex",
		ft = { "tex", "plaintex", "latex" },
		init = function()
			-- General
			vim.g.tex_flavor = "latex"
			vim.g.vimtex_quickfix_mode = 0
			vim.g.vimtex_syntax_enabled = 1
			vim.g.vimtex_complete_close_braces = 1

			-- Compiler (latexmk is default; make it explicit)
			vim.g.vimtex_compiler_method = "latexmk"
			vim.g.vimtex_compiler_latexmk = {
				build_dir = "build",
				callback = 1,
				continuous = 1,
				executable = "latexmk",
				options = {
					"-pdf",
					"-interaction=nonstopmode",
					"-synctex=1",
					"-file-line-error",
				},
			}

			-- Viewer (macOS: Skim; Linux: Zathura)
			if vim.fn.has("mac") == 1 then
				vim.g.vimtex_view_method = "skim"
				vim.g.vimtex_view_skim_sync = 1
				vim.g.vimtex_view_skim_activate = 1
			else
				vim.g.vimtex_view_method = "zathura"
			end

			-- Mappings (VimTeX also provides \ll, \lv, etc.)
			-- \ll: compile, \lk: stop, \lv: view, \lc: clean, \le: errors
		end,
	},

	-- Snippets for LaTeX (works with LuaSnip)
	{
		"iurimateus/luasnip-latex-snippets.nvim",
		dependencies = { "L3MON4D3/LuaSnip" },
		ft = { "tex", "plaintex", "latex" },
		config = function()
			require("luasnip-latex-snippets").setup({
				use_treesitter = true,
			})
		end,
	},
}
