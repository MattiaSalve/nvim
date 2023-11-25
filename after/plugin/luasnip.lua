require"luasnip".config.set_config({
   
   enable_autosnippets = true,
   update_events = 'TextChanged,TextChangedI',

})

require("luasnip.loaders.from_lua").load({paths = {"~/.config/nvim/lua/core/snippets"}})

