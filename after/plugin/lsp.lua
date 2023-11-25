local lsp = require("lsp-zero")
local luasnip = require "luasnip"

lsp.preset("recommended")

require "mason".setup({})
require "mason-lspconfig".setup({
   ensure_installed =  {
      "ltex",
      "lua_ls",
      "pylsp",
      "clangd",
   },
   handlers = {
    lsp.default_setup,
    lua_ls = function()
      local lua_opts = lsp.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,}
})

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select} 
local cmp_mappings = lsp.defaults.cmp_mappings({
   ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
   ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
   ["<C-y>"] = cmp.mapping.confirm({select = true}),
   ["<C-Space>"] = cmp.mapping.complete(),
})

cmp.setup({
   snippet = {
      expand = function(args)
         require "luasnip".lsp_expand(args.body)
      end,
   },
   sources = cmp.config.sources({
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "path" },
   }),
   mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<CR>"] = cmp.mapping.confirm({
         behavior = cmp.ConfirmBehavior.Replace,
         select = true,
      }),
      ["<Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_next_item()
         elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
            --			elseif has_words_before() then
            --				cmp.complete()
         else
            fallback()
         end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_prev_item()
         elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
         else
            fallback()
         end
      end, { "i", "s" }),
   },
})


local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')["lua_ls"].setup {
   capabilities = capabilities
}

lsp.set_preferences({
   sign_icons = {}
})

lsp.on_attach(function(client, bufnr)
   local opts = {buffer = bufnr, remap = false}

   vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
   vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
   vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
   vim.keymap.set("n", "<leader>vd", function() vim.lsp.buf.open_float() end, opts)
   vim.keymap.set("n", "[d", function() vim.lsp.buf.goto_next() end, opts)
   vim.keymap.set("n", "]d", function() vim.lsp.buf.goto_prev() end, opts)
   vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
   vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
   vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
   vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

