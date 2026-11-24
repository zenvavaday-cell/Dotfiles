-- Amber Strata palette for Neovim.
-- Palette ported from CoolRetroTermAmber via zclar/ghostty-strata.

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "strata"

local p = {
  bg = "#100902",
  bg1 = "#1B0F04",
  bg2 = "#2B1806",
  bg3 = "#3A2008",
  fg = "#EA851D",
  fg1 = "#DC841C",
  fg2 = "#B97A26",
  fg3 = "#9A5A16",
  green = "#CDAA24",
  green_bright = "#FFD052",
  red = "#B9370C",
  red_bright = "#FF6918",
  yellow = "#EB9114",
  yellow_bright = "#FFB52E",
  blue = "#B97A26",
  blue_bright = "#FFC34D",
  magenta = "#A53E22",
  magenta_bright = "#F57D3E",
  cyan = "#866F26",
  cyan_bright = "#F2B748",
}

local set = vim.api.nvim_set_hl
local function link(group, target)
  set(0, group, { link = target })
end

-- Editor UI ---------------------------------------------------------------
set(0, "Normal", { fg = p.fg, bg = p.bg })
set(0, "NormalNC", { fg = p.fg1, bg = p.bg })
set(0, "NormalFloat", { fg = p.fg, bg = p.bg1 })
set(0, "FloatBorder", { fg = p.green, bg = p.bg1 })
set(0, "FloatTitle", { fg = p.green, bg = p.bg1, bold = true })
set(0, "Cursor", { fg = p.bg, bg = p.green })
set(0, "lCursor", { fg = p.bg, bg = p.green })
set(0, "CursorIM", { fg = p.bg, bg = p.green })
set(0, "TermCursor", { fg = p.bg, bg = p.green })
set(0, "TermCursorNC", { fg = p.bg, bg = p.fg2 })
set(0, "CursorLine", { bg = p.bg1 })
set(0, "CursorColumn", { bg = p.bg1 })
set(0, "CursorLineNr", { fg = p.green, bold = true })
set(0, "LineNr", { fg = p.bg3 })
set(0, "LineNrAbove", { fg = p.fg3 })
set(0, "LineNrBelow", { fg = p.fg3 })
set(0, "SignColumn", { fg = p.fg2, bg = p.bg })
set(0, "FoldColumn", { fg = p.fg2, bg = p.bg })
set(0, "ColorColumn", { bg = p.bg1 })
set(0, "Visual", { bg = p.bg3 })
set(0, "VisualNOS", { bg = p.bg3 })
set(0, "Search", { fg = p.bg, bg = p.green })
set(0, "IncSearch", { fg = p.bg, bg = p.yellow })
set(0, "CurSearch", { fg = p.bg, bg = p.yellow })
set(0, "MatchParen", { fg = p.green, bold = true })
set(0, "Pmenu", { fg = p.fg, bg = p.bg1 })
set(0, "PmenuSel", { fg = p.bg, bg = p.green, bold = true })
set(0, "PmenuSbar", { bg = p.bg2 })
set(0, "PmenuThumb", { bg = p.bg3 })
set(0, "StatusLine", { fg = p.fg, bg = p.bg2 })
set(0, "StatusLineNC", { fg = p.fg2, bg = p.bg1 })
set(0, "WinSeparator", { fg = p.bg3 })
set(0, "VertSplit", { fg = p.bg3 })
set(0, "TabLine", { fg = p.fg2, bg = p.bg1 })
set(0, "TabLineSel", { fg = p.bg, bg = p.green, bold = true })
set(0, "TabLineFill", { bg = p.bg1 })
set(0, "Directory", { fg = p.green })
set(0, "Title", { fg = p.green, bold = true })
set(0, "ErrorMsg", { fg = p.red_bright })
set(0, "WarningMsg", { fg = p.yellow_bright })
set(0, "MoreMsg", { fg = p.green_bright })
set(0, "ModeMsg", { fg = p.fg, bold = true })
set(0, "Question", { fg = p.green_bright })
set(0, "NonText", { fg = p.bg3 })
set(0, "SpecialKey", { fg = p.bg3 })
set(0, "Whitespace", { fg = p.bg2 })
set(0, "EndOfBuffer", { fg = p.bg })
set(0, "Conceal", { fg = p.fg2 })
set(0, "Folded", { fg = p.fg1, bg = p.bg1 })
set(0, "QuickFixLine", { bg = p.bg2 })
set(0, "WildMenu", { fg = p.bg, bg = p.green })
set(0, "Error", { fg = p.red_bright })
set(0, "Todo", { fg = p.bg, bg = p.yellow, bold = true })
set(0, "Underlined", { fg = p.blue_bright, underline = true })
set(0, "Ignore", { fg = p.fg3 })

-- Diff --------------------------------------------------------------------
set(0, "DiffAdd", { fg = p.green_bright, bg = "#1F1603" })
set(0, "DiffChange", { fg = p.yellow_bright, bg = "#2A1B05" })
set(0, "DiffDelete", { fg = p.red_bright, bg = "#2A0D05" })
set(0, "DiffText", { fg = p.yellow_bright, bg = "#3A2508", bold = true })
set(0, "Added", { fg = p.green_bright })
set(0, "Changed", { fg = p.yellow_bright })
set(0, "Removed", { fg = p.red_bright })

-- Syntax ------------------------------------------------------------------
set(0, "Comment", { fg = p.fg3, italic = true })
set(0, "Constant", { fg = p.yellow })
set(0, "String", { fg = p.green_bright })
set(0, "Character", { fg = p.green_bright })
set(0, "Number", { fg = p.yellow })
set(0, "Boolean", { fg = p.yellow })
set(0, "Float", { fg = p.yellow })
set(0, "Identifier", { fg = p.fg })
set(0, "Function", { fg = p.green })
set(0, "Statement", { fg = p.green })
set(0, "Conditional", { fg = p.green })
set(0, "Repeat", { fg = p.green })
set(0, "Label", { fg = p.green })
set(0, "Operator", { fg = p.fg1 })
set(0, "Keyword", { fg = p.green })
set(0, "Exception", { fg = p.red_bright })
set(0, "PreProc", { fg = p.magenta })
set(0, "Include", { fg = p.magenta })
set(0, "Define", { fg = p.magenta })
set(0, "Macro", { fg = p.magenta })
set(0, "PreCondit", { fg = p.magenta })
set(0, "Type", { fg = p.cyan_bright })
set(0, "StorageClass", { fg = p.cyan })
set(0, "Structure", { fg = p.cyan })
set(0, "Typedef", { fg = p.cyan })
set(0, "Special", { fg = p.cyan_bright })
set(0, "SpecialChar", { fg = p.cyan_bright })
set(0, "Tag", { fg = p.green })
set(0, "Delimiter", { fg = p.fg2 })
set(0, "SpecialComment", { fg = p.fg2, italic = true })
set(0, "Debug", { fg = p.red_bright })

-- Diagnostics -------------------------------------------------------------
set(0, "DiagnosticError", { fg = p.red_bright })
set(0, "DiagnosticWarn", { fg = p.yellow_bright })
set(0, "DiagnosticInfo", { fg = p.blue_bright })
set(0, "DiagnosticHint", { fg = p.cyan_bright })
set(0, "DiagnosticOk", { fg = p.green_bright })
set(0, "DiagnosticUnderlineError", { sp = p.red_bright, undercurl = true })
set(0, "DiagnosticUnderlineWarn", { sp = p.yellow_bright, undercurl = true })
set(0, "DiagnosticUnderlineInfo", { sp = p.blue_bright, undercurl = true })
set(0, "DiagnosticUnderlineHint", { sp = p.cyan_bright, undercurl = true })
set(0, "DiagnosticUnderlineOk", { sp = p.green_bright, undercurl = true })
set(0, "DiagnosticVirtualTextError", { fg = p.red_bright, bg = "#2A0D05" })
set(0, "DiagnosticVirtualTextWarn", { fg = p.yellow_bright, bg = "#2A1B05" })
set(0, "DiagnosticVirtualTextInfo", { fg = p.blue_bright, bg = "#241A0A" })
set(0, "DiagnosticVirtualTextHint", { fg = p.cyan_bright, bg = "#2A2208" })
set(0, "DiagnosticVirtualTextOk", { fg = p.green_bright, bg = "#1F1603" })
set(0, "LspReferenceText", { bg = p.bg2 })
set(0, "LspReferenceRead", { bg = p.bg2 })
set(0, "LspReferenceWrite", { bg = p.bg2, underline = true })
set(0, "LspSignatureActiveParameter", { fg = p.green, bold = true })
set(0, "LspCodeLens", { fg = p.fg3, italic = true })
set(0, "LspInlayHint", { fg = p.fg3, bg = p.bg1, italic = true })

-- Spell -------------------------------------------------------------------
set(0, "SpellBad", { sp = p.red_bright, undercurl = true })
set(0, "SpellCap", { sp = p.yellow_bright, undercurl = true })
set(0, "SpellLocal", { sp = p.blue_bright, undercurl = true })
set(0, "SpellRare", { sp = p.magenta_bright, undercurl = true })

-- Treesitter --------------------------------------------------------------
set(0, "@comment", { link = "Comment" })
set(0, "@error", { fg = p.red_bright })
set(0, "@none", {})
set(0, "@preproc", { link = "PreProc" })
set(0, "@define", { link = "Define" })
set(0, "@operator", { link = "Operator" })
set(0, "@punctuation", { fg = p.fg2 })
set(0, "@punctuation.bracket", { fg = p.fg2 })
set(0, "@punctuation.delimiter", { fg = p.fg2 })
set(0, "@punctuation.special", { fg = p.cyan })
set(0, "@string", { link = "String" })
set(0, "@string.regex", { fg = p.cyan_bright })
set(0, "@string.escape", { fg = p.cyan_bright })
set(0, "@string.special", { fg = p.cyan_bright })
set(0, "@character", { link = "Character" })
set(0, "@character.special", { fg = p.cyan_bright })
set(0, "@boolean", { link = "Boolean" })
set(0, "@number", { link = "Number" })
set(0, "@number.float", { link = "Float" })
set(0, "@type", { link = "Type" })
set(0, "@type.builtin", { fg = p.cyan })
set(0, "@attribute", { fg = p.yellow })
set(0, "@property", { fg = p.fg1 })
set(0, "@function", { link = "Function" })
set(0, "@function.builtin", { fg = p.green_bright })
set(0, "@function.call", { fg = p.green })
set(0, "@function.macro", { fg = p.magenta })
set(0, "@method", { fg = p.green })
set(0, "@method.call", { fg = p.green })
set(0, "@constructor", { fg = p.cyan_bright })
set(0, "@parameter", { fg = p.fg1 })
set(0, "@parameter.reference", { fg = p.fg1 })
set(0, "@keyword", { link = "Keyword" })
set(0, "@keyword.function", { fg = p.magenta })
set(0, "@keyword.operator", { fg = p.fg1 })
set(0, "@keyword.return", { fg = p.magenta })
set(0, "@keyword.conditional", { fg = p.magenta })
set(0, "@keyword.repeat", { fg = p.magenta })
set(0, "@keyword.import", { fg = p.magenta })
set(0, "@keyword.exception", { fg = p.red_bright })
set(0, "@conditional", { link = "Conditional" })
set(0, "@repeat", { link = "Repeat" })
set(0, "@label", { link = "Label" })
set(0, "@include", { link = "Include" })
set(0, "@exception", { link = "Exception" })
set(0, "@variable", { fg = p.fg })
set(0, "@variable.builtin", { fg = p.cyan_bright })
set(0, "@variable.parameter", { fg = p.fg1 })
set(0, "@variable.member", { fg = p.fg1 })
set(0, "@constant", { fg = p.yellow })
set(0, "@constant.builtin", { fg = p.yellow })
set(0, "@constant.macro", { fg = p.magenta })
set(0, "@module", { fg = p.cyan_bright })
set(0, "@namespace", { fg = p.cyan_bright })
set(0, "@symbol", { fg = p.yellow })
set(0, "@text", { fg = p.fg })
set(0, "@text.strong", { bold = true })
set(0, "@text.emphasis", { italic = true })
set(0, "@text.underline", { underline = true })
set(0, "@text.title", { fg = p.green, bold = true })
set(0, "@text.literal", { fg = p.green_bright })
set(0, "@text.uri", { fg = p.blue_bright, underline = true })
set(0, "@text.math", { fg = p.cyan_bright })
set(0, "@text.environment", { fg = p.magenta })
set(0, "@text.environment.name", { fg = p.cyan_bright })
set(0, "@text.reference", { fg = p.blue_bright })
set(0, "@text.todo", { link = "Todo" })
set(0, "@text.note", { fg = p.blue_bright, bold = true })
set(0, "@text.warning", { fg = p.yellow_bright, bold = true })
set(0, "@text.danger", { fg = p.red_bright, bold = true })
set(0, "@tag", { fg = p.green })
set(0, "@tag.attribute", { fg = p.yellow })
set(0, "@tag.delimiter", { fg = p.fg2 })

-- Telescope ---------------------------------------------------------------
set(0, "TelescopeNormal", { fg = p.fg, bg = p.bg })
set(0, "TelescopeBorder", { fg = p.green, bg = p.bg })
set(0, "TelescopeTitle", { fg = p.bg, bg = p.green, bold = true })
set(0, "TelescopePromptNormal", { fg = p.fg, bg = p.bg1 })
set(0, "TelescopePromptBorder", { fg = p.bg3, bg = p.bg1 })
set(0, "TelescopePromptTitle", { fg = p.bg, bg = p.green, bold = true })
set(0, "TelescopePromptPrefix", { fg = p.green, bg = p.bg1 })
set(0, "TelescopeSelection", { fg = p.fg, bg = p.bg2 })
set(0, "TelescopeSelectionCaret", { fg = p.green, bg = p.bg2 })
set(0, "TelescopeMultiSelection", { fg = p.yellow, bg = p.bg2 })
set(0, "TelescopeMatching", { fg = p.green, bold = true })
set(0, "TelescopeResultsNormal", { fg = p.fg, bg = p.bg })
set(0, "TelescopeResultsBorder", { fg = p.green, bg = p.bg })
set(0, "TelescopeResultsTitle", { fg = p.bg, bg = p.green, bold = true })
set(0, "TelescopePreviewNormal", { fg = p.fg, bg = p.bg })
set(0, "TelescopePreviewBorder", { fg = p.green, bg = p.bg })
set(0, "TelescopePreviewTitle", { fg = p.bg, bg = p.green, bold = true })

-- nvim-tree ---------------------------------------------------------------
set(0, "NvimTreeNormal", { fg = p.fg, bg = p.bg })
set(0, "NvimTreeNormalNC", { fg = p.fg1, bg = p.bg })
set(0, "NvimTreeWinSeparator", { fg = p.bg3, bg = p.bg })
set(0, "NvimTreeRootFolder", { fg = p.green, bold = true })
set(0, "NvimTreeFolderIcon", { fg = p.green })
set(0, "NvimTreeFolderName", { fg = p.fg1 })
set(0, "NvimTreeOpenedFolderName", { fg = p.green, bold = true })
set(0, "NvimTreeEmptyFolderName", { fg = p.fg3 })
set(0, "NvimTreeOpenedFile", { fg = p.green_bright })
set(0, "NvimTreeSpecialFile", { fg = p.yellow })
set(0, "NvimTreeSymlink", { fg = p.cyan_bright })
set(0, "NvimTreeExecFile", { fg = p.green_bright })
set(0, "NvimTreeImageFile", { fg = p.magenta_bright })
set(0, "NvimTreeIndentMarker", { fg = p.bg3 })
set(0, "NvimTreeGitDirty", { fg = p.yellow })
set(0, "NvimTreeGitStaged", { fg = p.green })
set(0, "NvimTreeGitMerge", { fg = p.magenta })
set(0, "NvimTreeGitRenamed", { fg = p.blue_bright })
set(0, "NvimTreeGitNew", { fg = p.green_bright })
set(0, "NvimTreeGitDeleted", { fg = p.red_bright })
set(0, "NvimTreeGitIgnored", { fg = p.fg3 })

-- which-key ---------------------------------------------------------------
set(0, "WhichKey", { fg = p.green, bold = true })
set(0, "WhichKeyGroup", { fg = p.cyan_bright })
set(0, "WhichKeyDesc", { fg = p.fg1 })
set(0, "WhichKeySeparator", { fg = p.fg3 })
set(0, "WhichKeyFloat", { bg = p.bg1 })
set(0, "WhichKeyBorder", { fg = p.green, bg = p.bg1 })
set(0, "WhichKeyValue", { fg = p.fg2 })
set(0, "WhichKeyTitle", { fg = p.bg, bg = p.green, bold = true })

-- nvim-cmp ----------------------------------------------------------------
set(0, "CmpItemAbbr", { fg = p.fg1 })
set(0, "CmpItemAbbrDeprecated", { fg = p.fg3, strikethrough = true })
set(0, "CmpItemAbbrMatch", { fg = p.green, bold = true })
set(0, "CmpItemAbbrMatchFuzzy", { fg = p.green, bold = true })
set(0, "CmpItemKind", { fg = p.cyan_bright })
set(0, "CmpItemMenu", { fg = p.fg3 })
set(0, "CmpGhostText", { fg = p.fg3, italic = true })

-- Alpha dashboard ---------------------------------------------------------
set(0, "AlphaHeader", { fg = p.green })
set(0, "AlphaButtons", { fg = p.fg1 })
set(0, "AlphaShortcut", { fg = p.green, bold = true })
set(0, "AlphaFooter", { fg = p.fg3, italic = true })
link("DashboardHeader", "AlphaHeader")
link("DashboardCenter", "AlphaButtons")
link("DashboardShortcut", "AlphaShortcut")
link("DashboardFooter", "AlphaFooter")

-- gitsigns ----------------------------------------------------------------
set(0, "GitSignsAdd", { fg = p.green_bright })
set(0, "GitSignsChange", { fg = p.yellow_bright })
set(0, "GitSignsDelete", { fg = p.red_bright })

-- Terminal palette (matches kitty) ---------------------------------------
vim.g.terminal_color_0 = p.bg
vim.g.terminal_color_1 = p.red
vim.g.terminal_color_2 = p.green
vim.g.terminal_color_3 = p.yellow
vim.g.terminal_color_4 = p.blue
vim.g.terminal_color_5 = p.magenta
vim.g.terminal_color_6 = p.cyan
vim.g.terminal_color_7 = p.fg1
vim.g.terminal_color_8 = p.bg3
vim.g.terminal_color_9 = p.red_bright
vim.g.terminal_color_10 = p.green_bright
vim.g.terminal_color_11 = p.yellow_bright
vim.g.terminal_color_12 = p.blue_bright
vim.g.terminal_color_13 = p.magenta_bright
vim.g.terminal_color_14 = p.cyan_bright
vim.g.terminal_color_15 = p.fg
