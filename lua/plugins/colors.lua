return {
    { 'folke/tokyonight.nvim' },
    { 'Shatur/neovim-ayu', name = 'ayu' },
    { 'kepano/flexoki-neovim', name = 'flexoki' },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            require('rose-pine').setup { variant = 'moon' }
        end,
    },
    { 'rebelot/kanagawa.nvim' },
}
