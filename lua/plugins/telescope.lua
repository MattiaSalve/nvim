return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'BurntSushi/ripgrep',
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        local builtin = require 'telescope.builtin'
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope!' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', 'gd', function()
            builtin.lsp_definitions { jump_type = 'vsplit' }
        end)

        vim.keymap.set('n', '<leader>ws', function()
            builtin.grep_string { search = vim.fn.input 'Grep > ' }
        end)
    end,
}
