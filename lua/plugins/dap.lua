return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'rcarriga/nvim-dap-ui',
        'nvim-neotest/nvim-nio',
        'jay-babu/mason-nvim-dap.nvim',
    },
    config = function()
        local dap = require 'dap'
        local dapui = require 'dapui'

        dapui.setup()
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        vim.keymap.set('n', '<leader>dp', dap.toggle_breakpoint, { desc = 'Toggle dap breakpoint' })
        vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Dap conrinue' })

        require('mason-nvim-dap').setup {
            handlers = {},
        }
    end,
}
