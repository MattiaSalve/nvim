return {
    'zaldih/themery.nvim',
    config = function()
        require('themery').setup {
            themes = {
                'tokyonight',

                'flexoki-dark',
                'flexoki-light',

                'rose-pine',

                { name = 'ayu', colorscheme = 'ayu-mirage' },

                {
                    name = 'Kanagawa light',
                    colorscheme = 'kanagawa-lotus',
                },
                {
                    name = 'Kanagawa wave',
                    colorscheme = 'kanagawa-wave',
                },
                {
                    name = 'Kanagawa dragon',
                    colorscheme = 'kanagawa-dragon',
                },
            },
            themeConfigFile = '~/.config/nvim/lua/colors.lua',
            livePreview = true,
        }
    end,
}
