-- Cyberdream colorscheme for Neovim
-- Ported from https://github.com/scottmckendry/cyberdream.nvim

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "cyberdream"

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

local set = vim.api.nvim_set_hl
local function link(group, target)
  set(0, group, { link = target })
end

-- Helper to blend colors (approximate)
local function blend(bg, fg, alpha)
  -- Simple approximation: just return the fg for highlights
  return fg
end

-- Editor UI ---------------------------------------------------------------
set(0, "Normal", { fg = p.fg, bg = p.bg })
set(0, "NormalNC", { fg = p.fg, bg = p.bg })
set(0, "NormalFloat", { fg = p.fg, bg = p.bg })
set(0, "FloatBorder", { fg = p.bg_highlight, bg = p.bg })
set(0, "FloatTitle", { fg = p.cyan, bg = p.bg })
set(0, "Cursor", { fg = p.bg, bg = p.fg })
set(0, "lCursor", { fg = p.bg, bg = p.fg })
set(0, "CursorIM", { fg = p.bg, bg = p.fg })
set(0, "CursorLine", { bg = p.bg_highlight })
set(0, "CursorColumn", { bg = p.bg_highlight })
set(0, "ColorColumn", { bg = p.bg_highlight })
set(0, "CursorLineNr", { fg = p.grey })
set(0, "LineNr", { fg = p.bg_highlight })
set(0, "SignColumn", { fg = p.grey, bg = p.bg })
set(0, "FoldColumn", { fg = p.grey, bg = p.bg })
set(0, "Folded", { fg = p.grey, bg = p.bg })
set(0, "VertSplit", { fg = p.bg_highlight, bg = p.bg })
set(0, "WinSeparator", { fg = p.bg_highlight, bg = p.bg })
set(0, "StatusLine", { fg = p.fg, bg = p.bg })
set(0, "StatusLineNC", { fg = p.grey, bg = p.bg })
set(0, "TabLine", { fg = p.grey, bg = p.bg })
set(0, "TabLineFill", { fg = p.grey, bg = p.bg })
set(0, "TabLineSel", { fg = p.fg, bg = p.bg_highlight })
set(0, "WinBar", { fg = p.fg, bg = p.bg })
set(0, "WinBarNC", { fg = p.grey, bg = p.bg })
set(0, "Pmenu", { fg = p.fg, bg = p.bg })
set(0, "PmenuSel", { fg = p.fg, bg = p.bg_highlight })
set(0, "PmenuSbar", { fg = p.bg, bg = p.bg_highlight })
set(0, "PmenuThumb", { fg = p.bg, bg = p.bg_highlight })
set(0, "PmenuMatch", { fg = p.cyan, bg = p.bg_highlight })
set(0, "PmenuMatchSel", { fg = p.cyan, bg = p.bg_highlight })
set(0, "WildMenu", { fg = p.bg, bg = p.blue })
set(0, "Search", { fg = p.bg_alt, bg = p.fg })
set(0, "IncSearch", { fg = p.bg_alt, bg = p.cyan })
set(0, "CurSearch", { fg = p.bg_alt, bg = p.cyan })
set(0, "Substitute", { fg = p.red, bg = p.bg_highlight })
set(0, "MatchParen", { fg = p.pink, bg = p.bg_highlight })
set(0, "Visual", { bg = p.bg_highlight })
set(0, "VisualNOS", { bg = p.bg_highlight })
set(0, "Whitespace", { fg = p.bg_highlight })
set(0, "NonText", { fg = p.bg_highlight })
set(0, "SpecialKey", { fg = p.grey })
set(0, "Directory", { fg = p.blue })
set(0, "Title", { fg = p.fg })
set(0, "ErrorMsg", { fg = p.red })
set(0, "WarningMsg", { fg = p.orange })
set(0, "ModeMsg", { fg = p.fg })
set(0, "MsgArea", { fg = p.fg })
set(0, "MoreMsg", { fg = p.blue })
set(0, "Question", { fg = p.yellow })
set(0, "QuickFixLine", { bg = p.bg_highlight })

-- Syntax ------------------------------------------------------------------
set(0, "Comment", { fg = p.grey, italic = true })
set(0, "Constant", { fg = p.pink })
set(0, "String", { fg = p.green })
set(0, "Character", { fg = p.green })
set(0, "Number", { fg = p.orange })
set(0, "Boolean", { fg = p.cyan })
set(0, "Float", { fg = p.orange })

set(0, "Identifier", { fg = p.fg })
set(0, "Function", { fg = p.blue })
set(0, "Method", { fg = p.blue })

set(0, "Statement", { fg = p.magenta })
set(0, "Conditional", { fg = p.magenta })
set(0, "Repeat", { fg = p.magenta })
set(0, "Label", { fg = p.orange })
set(0, "Operator", { fg = p.purple })
set(0, "Keyword", { fg = p.orange })
set(0, "Exception", { fg = p.magenta })

set(0, "PreProc", { fg = p.cyan })
set(0, "Include", { fg = p.cyan })
set(0, "Define", { fg = p.cyan })
set(0, "Macro", { fg = p.cyan })
set(0, "PreCondit", { fg = p.cyan })

set(0, "Type", { fg = p.purple })
set(0, "StorageClass", { fg = p.purple })
set(0, "Structure", { fg = p.purple })
set(0, "Typedef", { fg = p.purple })

set(0, "Special", { fg = p.pink })
set(0, "SpecialChar", { fg = p.pink })
set(0, "Tag", { fg = p.blue })
set(0, "Delimiter", { fg = p.fg })
set(0, "SpecialComment", { fg = p.grey })
set(0, "Debug", { fg = p.orange })

set(0, "Underlined", { underline = true })
set(0, "Bold", { bold = true })
set(0, "Italic", { italic = true })
set(0, "Error", { fg = p.red })
set(0, "Todo", { fg = p.purple, bold = true })

-- Diff --------------------------------------------------------------------
set(0, "DiffAdd", { bg = blend(p.bg, p.green, 0.8) })
set(0, "DiffChange", { bg = blend(p.bg, p.blue, 0.8) })
set(0, "DiffDelete", { bg = blend(p.bg, p.red, 0.8) })
set(0, "DiffText", { bg = blend(p.bg, p.orange, 0.8) })
set(0, "Added", { fg = p.green })
set(0, "Changed", { fg = p.blue })
set(0, "Removed", { fg = p.red })

-- LSP ---------------------------------------------------------------------
set(0, "LspReferenceText", { bg = p.bg_highlight })
set(0, "LspReferenceRead", { bg = p.bg_highlight })
set(0, "LspReferenceWrite", { bg = p.bg_highlight })
set(0, "LspSignatureActiveParameter", { fg = p.orange })
set(0, "LspCodeLens", { fg = p.grey })
set(0, "LspInlayHint", { fg = p.grey })
set(0, "LspInfoBorder", { fg = p.bg })

set(0, "DiagnosticError", { fg = p.red })
set(0, "DiagnosticWarn", { fg = p.yellow })
set(0, "DiagnosticInfo", { fg = p.blue })
set(0, "DiagnosticHint", { fg = p.cyan })
set(0, "DiagnosticUnnecessary", { fg = p.grey })

set(0, "DiagnosticVirtualTextError", { fg = p.red })
set(0, "DiagnosticVirtualTextWarn", { fg = p.yellow })
set(0, "DiagnosticVirtualTextInfo", { fg = p.blue })
set(0, "DiagnosticVirtualTextHint", { fg = p.cyan })

set(0, "DiagnosticUnderlineError", { undercurl = true, sp = p.red })
set(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = p.yellow })
set(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = p.blue })
set(0, "DiagnosticUnderlineHint", { undercurl = true, sp = p.cyan })

-- Terminal colors ---------------------------------------------------------
vim.g.terminal_color_0 = p.bg
vim.g.terminal_color_8 = p.bg_alt
vim.g.terminal_color_7 = p.fg
vim.g.terminal_color_15 = p.grey
vim.g.terminal_color_1 = p.red
vim.g.terminal_color_9 = p.red
vim.g.terminal_color_2 = p.green
vim.g.terminal_color_10 = p.green
vim.g.terminal_color_3 = p.yellow
vim.g.terminal_color_11 = p.yellow
vim.g.terminal_color_4 = p.blue
vim.g.terminal_color_12 = p.blue
vim.g.terminal_color_5 = p.purple
vim.g.terminal_color_13 = p.purple
vim.g.terminal_color_6 = p.cyan
vim.g.terminal_color_14 = p.cyan

-- Treesitter --------------------------------------------------------------
link("@variable", "Identifier")
link("@variable.builtin", "Special")
link("@variable.parameter", "Identifier")
link("@variable.member", "Identifier")
link("@constant", "Constant")
link("@constant.builtin", "Special")
link("@constant.macro", "Define")
link("@module", "Identifier")
link("@label", "Label")
link("@string", "String")
link("@string.escape", "SpecialChar")
link("@character", "Character")
link("@boolean", "Boolean")
link("@number", "Number")
link("@type", "Type")
link("@type.builtin", "Type")
link("@attribute", "Special")
link("@property", "Identifier")
link("@function", "Function")
link("@function.builtin", "Special")
link("@function.macro", "Macro")
link("@function.method", "Function")
link("@constructor", "Special")
link("@operator", "Operator")
link("@keyword", "Keyword")
link("@keyword.function", "Keyword")
link("@keyword.operator", "Operator")
link("@keyword.return", "Keyword")
link("@conditional", "Conditional")
link("@repeat", "Repeat")
link("@exception", "Exception")
link("@debug", "Debug")
link("@include", "Include")
link("@preproc", "PreProc")
link("@define", "Define")

-- Markdown ----------------------------------------------------------------
set(0, "markdownH1", { fg = p.orange, bold = true })
set(0, "markdownH2", { fg = p.cyan, bold = true })
set(0, "markdownH3", { fg = p.blue, bold = true })
set(0, "markdownH4", { fg = p.purple, bold = true })
set(0, "markdownH5", { fg = p.magenta, bold = true })
set(0, "markdownH6", { fg = p.green, bold = true })
set(0, "markdownCode", { fg = p.cyan })
set(0, "markdownCodeBlock", { fg = p.cyan })
set(0, "markdownLinkText", { fg = p.blue, underline = true })
set(0, "markdownHeadingDelimiter", { fg = p.grey })

-- HTML --------------------------------------------------------------------
set(0, "htmlH1", { fg = p.orange, bold = true })
set(0, "htmlH2", { fg = p.orange, bold = true })

-- Git ---------------------------------------------------------------------
set(0, "gitcommitSummary", { fg = p.fg })
set(0, "gitcommitOverflow", { fg = p.red })
set(0, "gitcommitComment", { fg = p.grey })
set(0, "gitcommitUntracked", { fg = p.grey })
set(0, "gitcommitDiscarded", { fg = p.grey })
set(0, "gitcommitSelected", { fg = p.grey })
set(0, "gitcommitHeader", { fg = p.blue })
set(0, "gitcommitBranch", { fg = p.magenta })
set(0, "gitcommitNoBranch", { fg = p.magenta })
set(0, "gitcommitDiscardedType", { fg = p.red })
set(0, "gitcommitSelectedType", { fg = p.green })
set(0, "gitcommitUnmergedType", { fg = p.yellow })
set(0, "gitcommitOnBranch", { fg = p.grey })
set(0, "gitcommitDiscardedFile", { fg = p.red })
set(0, "gitcommitSelectedFile", { fg = p.green })
set(0, "gitcommitUnmergedFile", { fg = p.yellow })

-- Spell -------------------------------------------------------------------
set(0, "SpellBad", { sp = p.red, undercurl = true })
set(0, "SpellCap", { sp = p.yellow, undercurl = true })
set(0, "SpellLocal", { sp = p.blue, undercurl = true })
set(0, "SpellRare", { sp = p.purple, undercurl = true })

-- UI ----------------------------------------------------------------------
set(0, "Conceal", { fg = p.grey })
set(0, "EndOfBuffer", { fg = p.bg_highlight })