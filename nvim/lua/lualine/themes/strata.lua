-- Lualine theme for the Amber Strata palette.

local p = {
  bg = "#100902",
  bg1 = "#1B0F04",
  bg2 = "#2B1806",
  fg = "#EA851D",
  fg1 = "#DC841C",
  fg2 = "#B97A26",
  green = "#CDAA24",
  red = "#B9370C",
  yellow = "#EB9114",
  blue = "#B97A26",
  magenta = "#A53E22",
  cyan = "#866F26",
}

return {
  normal = {
    a = { fg = p.bg, bg = p.green, gui = "bold" },
    b = { fg = p.fg, bg = p.bg2 },
    c = { fg = p.fg1, bg = p.bg1 },
  },
  insert = {
    a = { fg = p.bg, bg = p.blue, gui = "bold" },
    b = { fg = p.fg, bg = p.bg2 },
    c = { fg = p.fg1, bg = p.bg1 },
  },
  visual = {
    a = { fg = p.bg, bg = p.yellow, gui = "bold" },
    b = { fg = p.fg, bg = p.bg2 },
    c = { fg = p.fg1, bg = p.bg1 },
  },
  replace = {
    a = { fg = p.bg, bg = p.red, gui = "bold" },
    b = { fg = p.fg, bg = p.bg2 },
    c = { fg = p.fg1, bg = p.bg1 },
  },
  command = {
    a = { fg = p.bg, bg = p.cyan, gui = "bold" },
    b = { fg = p.fg, bg = p.bg2 },
    c = { fg = p.fg1, bg = p.bg1 },
  },
  terminal = {
    a = { fg = p.bg, bg = p.magenta, gui = "bold" },
    b = { fg = p.fg, bg = p.bg2 },
    c = { fg = p.fg1, bg = p.bg1 },
  },
  inactive = {
    a = { fg = p.fg2, bg = p.bg1 },
    b = { fg = p.fg2, bg = p.bg1 },
    c = { fg = p.fg2, bg = p.bg1 },
  },
}
