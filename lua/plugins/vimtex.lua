return{
	{
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
	  local g = vim.g

      g.vimtex_compiler_latexmk = {
          options = {
              "-verbose",
              "-interaction=nonstopmode",
              "-shell-escape",
              "-xelatex"
          }
      }

	  g.vimtex_quickfix_ignore_filters = {"Underfull", "Overfull", "Font"}
  end
}
}
