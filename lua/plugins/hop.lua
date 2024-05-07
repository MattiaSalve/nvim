return {
    'smoka7/hop.nvim',
    version = '*',
    opts = {
        keys = 'etovxqpdygfblzhckisuran',
    },
    config = function()
        local set = vim.keymap.set
        local hop = require 'hop'
        local directions = require('hop.hint').HintDirection

        hop.setup {}

        set('', 'f', function()
            hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = false }
        end, { remap = true })

        set('', 'F', function()
            hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = false }
        end, { remap = true })

        set('', 't', function()
            hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }
        end, { remap = true })

        set('', 'T', function()
            hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }
        end, { remap = true })
    end,
}
