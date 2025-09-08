return {
	{
		"zbirenbaum/copilot.lua",
		event = { "InsertEnter" },
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					keymap = {
						accept = "<C-l>", -- Accept suggestion with Ctrl+l
						next = "<C-]>",
						prev = "<C-[>",
						dismiss = "<C-e>",
					},
				},
				panel = { enabled = true }, -- disable the panel if you want minimal
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		dependencies = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
