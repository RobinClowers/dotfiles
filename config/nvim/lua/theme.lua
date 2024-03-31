local onedark = require("onedark")

onedark.setup({
  -- Main options --
  -- Default theme style.
  -- Choose between "dark", "darker", "cool", "deep", "warm", "warmer" and "light"
  style = "darker",

  -- Custom Highlights --
  colors = {
    bg0 = "#1C1D1B",
  }, -- Override default colors

  highlights = {
    ["@keyword"] = {fg = "$red"},
    ["@keyword.conditional"] = {fg = "$purple"},
    ["@keyword.directive"] = {fg = "$red"},
    ["@keyword.import"] = {fg = "$red"},
    ["@string"] = {fg = "$yellow"},
    ["@string.escape"] = {fg = "$grey"},
    ["@string.special"] = {fg = "$grey"},
    ["@tag"] = {fg = "$green" },
    ["@tag.attribute"] = {fg = "$blue"},
    ["@tag.delimiter"] =  {fg = "$grey" },
    ["@type"] = {fg = "$green"},
    ["@variable.parameter"] = {fg = "$cyan"},
    ["CocMenuSel"] = {bg = "$dark_cyan" },
  }, -- Override highlight groups
})
onedark.load()
