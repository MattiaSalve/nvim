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
        s({ trig = ";a", snippetType = "autosnippet" }, t({ "\\alpha" })),
        s({ trig = ";b", snippetType = "autosnippet" }, t({ "\\beta" })),
        s({ trig = ";d", snippetType = "autosnippet" }, t({ "\\delta" })),
        s({ trig = ";g", snippetType = "autosnippet" }, t({ "\\gamma" })),
        s({ trig = ";l", snippetType = "autosnippet" }, t({ "\\lambda" })),
        s({ trig = ";o", snippetType = "autosnippet" }, t({ "\\omega" })),
        s({ trig = ";t", snippetType = "autosnippet" }, t({ "\\tau" })),
        s({ trig = ";f", snippetType = "autosnippet" }, t({ "\\phi" })),
        s({ trig = "italic", snippetType = "autosnippet" }, fmt("\\textit{<>}", { i(1) }, { delimiters = "<>" })),
        s({ trig = "bold", snippetType = "autosnippet" }, fmt("\\textbf{<>}", { i(1) }, { delimiters = "<>" })),
        s({ trig = "ff" }, fmt("\\frac{<>}{<>}", { i(1), i(2) }, { delimiters = "<>" })),
        s({ trig = "cdot" }, fmt("{<>}\\cdot{<>}", { i(1), i(2) }, { delimiters = "<>" })),
        s({ trig = "sqrt" }, fmt("\\sqrt{<>}", { i(1) }, { delimiters = "<>" })),
        s({ trig = "eq" }, fmt(
        [[
        \begin{equation}
        <>
        \end{equation}
        ]],
        { i(1) },
        { delimiters = "<>" }
        )),
        s({ trig = "doc" }, fmt(
        [[
        \begin{document}
        <>
        \end{document}
        ]],
        { i(1) },
        { delimiters = "<>" }
        )),
        s({ trig = "item" }, fmt(
        [[
        \begin{itemize}
        \item <>
        \end{itemize}
        ]],
        { i(1) },
        { delimiters = "<>" }
        )),
        s({ trig = "boilerplate" }, fmt(
        [[
        \documentclass[]{report}
        \usepackage[a4paper, margin = 1in, includeheadfoot]{geometry}
        \usepackage{amsmath, graphicx tikz, fancyhdr, fontspec, multicol, unicode-math, lettrine, lipsum}
        \graphicspath{{./images}}
        \usepackage[italian]{babel}
        \setmainfont{DIN Next W1G}
        % \setmainfont{Economist Serif VF}

        \begin{document}
        <>
        \end{document}
        ]],
        { i(1) },
        { delimiters = "<>" }
        )),

        s({ trig = "beamer" }, fmt(
        [[
        \documentclass[aspectratio=1610]{beamer}
        \usetheme[progressbar = foot]{metropolis}
        \metroset{background=dark}
        \definecolor{dark}{HTML}{171B27}
        \definecolor{red}{HTML}{90323D}
        % \definecolor{white}{HTML}{EAE2D6}
        \definecolor{highlight}{HTML}{D8AA6F}

        \setbeamercolor*{background canvas}{bg=dark}
        \setbeamercolor*{title}{fg = white}
        \setbeamercolor*{frametitle}{fg=dark, bg = white}

        \usepackage{amsmath, tikz, pgfplots, fontspec, ragged2e}
        \usepackage[italian]{babel}
        \setsansfont{DIN Next W1G}
        \newfontfamily{\serif}{Economist Serif VF}
        \usefonttheme[onlymath]{serif}
        \setbeamercolor{progress bar}{fg = red}

        \begin{document}
        \title{<>}

        \begin{document}
        \begin{frame}[plain]\titlepage\end{frame}
        \begin{frame}{<>}
        <>
        \end{frame}
        \end{document}
        ]],
        { i(1), i(2), i(3) },
        { delimiters = "<>" }
        )),
    },
})
