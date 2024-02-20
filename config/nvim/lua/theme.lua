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
  }, -- Override highlight groups
})
onedark.load()

-- this theme works fine with the coc floating window selection
-- so there must be some color I need to change for onedark to work?
-- vim.cmd 'colo juliana'
