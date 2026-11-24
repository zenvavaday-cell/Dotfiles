-- Lualine theme for Cyberdream palette

local p = {
  bg = "#16181a",
  bg_alt = "#1e2124",
  bg_highlight = "#3c4048",
  fg = "#ffffff",
  grey = "#7b8496",
  blue = "#5ea1ff",
  green = "#5eff6c",
  cyan = "#5ef1ff",
  red = "#ff6e5e",
  yellow = "#f1ff5e",
  magenta = "#ff5ef1",
  pink = "#ff5ea0",
  orange = "#ffbd5e",
  purple = "#bd5eff",
}

return {
  normal = {
    a = { fg = p.bg, bg = p.green, gui = "bold" },
    b = { fg = p.fg, bg = p.bg_highlight },
    c = { fg = p.fg, bg = p.bg_alt },
  },
  insert = {
    a = { fg = p.bg, bg = p.blue, gui = "bold" },
    b = { fg = p.fg, bg = p.bg_highlight },
    c = { fg = p.fg, bg = p.bg_alt },
  },
  visual = {
    a = { fg = p.bg, bg = p.yellow, gui = "bold" },
    b = { fg = p.fg, bg = p.bg_highlight },
    c = { fg = p.fg, bg = p.bg_alt },
  },
  replace = {
    a = { fg = p.bg, bg = p.red, gui = "bold" },
    b = { fg = p.fg, bg = p.bg_highlight },
    c = { fg = p.fg, bg = p.bg_alt },
  },
  command = {
    a = { fg = p.bg, bg = p.cyan, gui = "bold" },
    b = { fg = p.fg, bg = p.bg_highlight },
    c = { fg = p.fg, bg = p.bg_alt },
  },
  terminal = {
    a = { fg = p.bg, bg = p.purple, gui = "bold" },
    b = { fg = p.fg, bg = p.bg_highlight },
    c = { fg = p.fg, bg = p.bg_alt },
  },
  inactive = {
    a = { fg = p.grey, bg = p.bg_alt },
    b = { fg = p.grey, bg = p.bg_alt },
    c = { fg = p.grey, bg = p.bg_alt },
  },
}