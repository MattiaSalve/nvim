return {
    {
        'lervag/vimtex',
        ft = { 'tex' },
        init = function()
            local g = vim.g

            g.vimtex_compiler_latexmk = {
                options = {
                    '-verbose',
                    '-interaction=nonstopmode',
                    '-shell-escape',
                    '-xelatex',
                },
            }

            g.vimtex_quickfix_ignore_filters = { 'Underfull', 'Overfull', 'Font' }
        end,
    },
}
