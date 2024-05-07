local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd({ 'BufWritePost' }, {
    callback = function()
        require('lint').try_lint 'ast-grep'
    end,
})

augroup('__formatter__', { clear = true })
autocmd('BufWritePost', {
    group = '__formatter__',
    command = ':FormatWrite',
})
