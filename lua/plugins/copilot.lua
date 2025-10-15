return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",

		opts = {
			window = {
				layout = "vertical",
				title = "Copilot Chat",
				width = 0.3,
			},

			headers = {
				user = "You",
				assistant = "Copilot",
				tool = "Tool",
			},
		},

		keys = {
			{ "<leader>zc", ":CopilotChat<CR>", mode = "n", desc = "Chat with Copilot" },
			{ "<leader>ze", ":CopilotChatExplain<CR>", mode = "v", desc = "Explain code" },
			{ "<leader>zr", ":CopilotChatReview<CR>", mode = "v", desc = "Review code" },
			{ "<leader>zf", ":CopilotChatFix<CR>", mode = "v", desc = "Fix code issues" },
			{ "<leader>zo", ":CopilotChatOptimize<CR>", mode = "v", desc = "Optimise code" },
		},
	},
}
