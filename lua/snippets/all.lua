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
                [[cmake_minimum_required(VERSION 3.23)

set(CMAKE_TOOLCHAIN_FILE ~/vcpkg/scripts/buildsystems/vcpkg.cmake)
set(CMAKE_CXX_STANDARD 17)

project(main)
add_executable(main main.cpp)

find_package(jsoncpp CONFIG REQUIRED)
find_package(cpr CONFIG REQUIRED)

target_include_directories(main PRIVATE ~/vcpkg/installed/arm64-osx/include/)
target_link_libraries(main PRIVATE JsonCpp::JsonCpp cpr::cpr)
<>]],
                { i(1) },
                { delimiters = '<>' }
            )
        ),
    },
})
