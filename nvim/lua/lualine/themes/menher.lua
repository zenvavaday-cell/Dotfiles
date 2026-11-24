-- Lualine theme for the menher i3-dots palette.

local p = {
  bg = "#111514",
  bg1 = "#191D1B",
  bg2 = "#303733",
  fg = "#C2C7C3",
  fg1 = "#A1A7A3",
  fg2 = "#747B76",
  green = "#697568",
  red = "#896D6D",
  yellow = "#8A8170",
  blue = "#687276",
  magenta = "#756E74",
  cyan = "#687773",
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
