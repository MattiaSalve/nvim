return{
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({
		enable_chat = true,
		keymaps = {
			vim.keymap.set("i", "<C-CR>", function() return vim.fn["codeium#Accept"]() end, {expr = true}),
		}
        })
    end
}
