local ls = require 'luasnip'
local s = ls.snippet
local node = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta

local date = function()
    return { os.date '%Y-%m-%d' }
end

ls.add_snippets(nil, {
    all = {
        s({
            trig = 'date',
            namr = 'Date',
            dscr = 'Date in the form of YYYY-MM-DD',
        }, {
            func(date, {}),
        }),
        s(
            { trig = 'cmakelist' },
            fmt(
                [[cmake_minimum_required(VERSION 3.10)
                set(CMAKE_CXX_STANDARD 17)
                set(CMAKE_CXX_STANDARD_REQUIRED ON)

                project(main)

                # add_subdirectory(lib)
                add_library(factorial STATIC lib/<>.cpp)
                target_include_directories(factorial PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/lib/include)


                add_executable(main main.cpp)
                target_link_libraries(main PUBLIC factorial)]],
                { i(1) },
                { delimiters = '<>' }
            )
        ),
    },
})
