return {
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'saadparwaiz1/cmp_luasnip' },
    {
        'hrsh7th/nvim-cmp',
        event = { 'InsertEnter', 'CmdlineEnter' },
        config = function()
            local cmp = require 'cmp'
            local luasnip = require 'luasnip'

            vim.opt.completeopt = 'menu,menuone,noselect'
            local lsp_zero = require 'lsp-zero'

            lsp_zero.on_attach(function(bufnr)
                lsp_zero.default_keymaps { buffer = bufnr }
            end)

            require('lspconfig').clangd.setup {}

            require('mason').setup {}
            require('mason-lspconfig').setup {
                ensure_installed = {},
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup {}
                    end,
                },
                opts = {
                    servers = {
                        clangd = {
                            mason = false,
                        },
                    },
                },
            }

            cmp.setup {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                sources = cmp.config.sources {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'copilot' },
                    -- { name = 'codeium' },
                    { name = 'path' },
                    { name = 'buffer' },
                    { name = 'cmp_r' },
                },
                mapping = {
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.expand_or_jumpable(-1) then
                            luasnip.expand_or_jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<CR>'] = cmp.mapping.confirm {
                        select = true,
                        behavior = cmp.ConfirmBehavior.Replace,
                    },
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
            }
        end,
    },
}
