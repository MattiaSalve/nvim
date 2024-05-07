return{
    'mhartington/formatter.nvim',
    config = function ()
        local util = require "formatter.util"

        require("formatter").setup {
            logging = true,
            log_level = vim.log.levels.WARN,
            filetype = {
                lua = {
                    require("formatter.filetypes.lua").ast_grep,
                    function()
                        if util.get_current_buffer_file_name() == "special.lua" then
                            return nil
                        end
                        return {
                            exe = "ast_grep",
                            args = {
                                "--search-parent-directories",
                                "--stdin-filepath",
                                util.escape_path(util.get_current_buffer_file_path()),
                                "--",
                                "-",
                            },
                            stdin = true,
                        }
                    end
                },
                tex = {
                    require("formatter.filetypes.tex").latexindent
                },
                ["*"] = {
                    require("formatter.filetypes.any").remove_trailing_whitespace,
                }
            }
        }
    end
}
