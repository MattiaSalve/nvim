local ls = require("luasnip")
local s = ls.snippet
local node = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

ls.add_snippets(nil, {
   tex = {
      s({trig = ";a", snippetType = "autosnippet"}, t({"\\alpha"})),
      s({trig = ";b", snippetType = "autosnippet"}, t({"\\beta"})),
      s({trig = ";d", snippetType = "autosnippet"}, t({"\\delta"})),
      s({trig = ";g", snippetType = "autosnippet"}, t({"\\gamma"})),
      s({trig = ";l", snippetType = "autosnippet"}, t({"\\lambda"})),
      s({trig = ";o", snippetType = "autosnippet"}, t({"\\omega"})),
      s({trig = ";t", snippetType = "autosnippet"}, t({"\\tau"})),
      s({trig = ";f", snippetType = "autosnippet"}, t({"\\phi"})),
      s({trig = "ff"}, fmt("\\frac{<>}{<>}", { i(1), i(2) }, { delimiters = "<>" })),
      s({trig = "eq"}, fmt(
         [[
            \begin{equation}
               <>
            \end{equation}
         ]],
         { i(1) },
         { delimiters = "<>" }
      )),
   },
})
