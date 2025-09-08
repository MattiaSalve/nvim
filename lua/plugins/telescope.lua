-- ~/.config/nvim/lua/plugins/telescope.lua
return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-j>"] = require("telescope.actions").move_selection_next,
							["<C-k>"] = require("telescope.actions").move_selection_previous,
						},
					},
				},
			})

			-- Keymaps for common telescope pickers
			local builtin = require("telescope.builtin")
			local keymap = vim.keymap.set
			local opts = { noremap = true, silent = true }

			keymap("n", "<leader>ff", builtin.find_files, opts)
			keymap("n", "<leader>fg", builtin.live_grep, opts)
			keymap("n", "<leader>fb", builtin.buffers, opts)
			keymap("n", "<leader>fh", builtin.help_tags, opts)
		end,
	},
}
