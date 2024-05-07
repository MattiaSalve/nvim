return{
    'zaldih/themery.nvim',
    config = function()
        require("themery").setup({
            themes = {
                "tokyonight",
                {
                    name = "Kanagawa light",
                    colorscheme = "kanagawa-lotus",
                },
                {
                    name = "Kanagawa dark",
                    colorscheme = "kanagawa",
                }
            },
            themeConfigFile = "~/.config/nvim/lua/colors.lua",
            livePreview = true,
        })
    end,
}
