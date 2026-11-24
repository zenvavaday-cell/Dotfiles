 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#19120d',
    base01 = '#261e19',
    base02 = '#312823',
    base03 = '#9f8d83',
    base04 = '#d7c3b7',
    base05 = '#f0dfd7',
    base06 = '#f0dfd7',
    base07 = '#f0dfd7',
    base08 = '#ffb4ab',
    base09 = '#c9ca94',
    base0A = '#e4bfa8',
    base0B = '#ffb786',
    base0C = '#c9ca94',
    base0D = '#ffb786',
    base0E = '#e4bfa8',
    base0F = '#ffdcc6',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#f0dfd7',          bg = '#19120d' })
  hi('TelescopeBorder',         { fg = '#9f8d83',             bg = '#19120d' })
  hi('TelescopePromptNormal',   { fg = '#f0dfd7',          bg = '#19120d' })
  hi('TelescopePromptBorder',   { fg = '#9f8d83',             bg = '#19120d' })
  hi('TelescopePromptPrefix',   { fg = '#ffb786',             bg = '#19120d' })
  hi('TelescopePromptCounter',  { fg = '#d7c3b7',  bg = '#19120d' })
  hi('TelescopePromptTitle',    { fg = '#19120d',             bg = '#ffb786' })
  hi('TelescopePreviewTitle',   { fg = '#19120d',             bg = '#e4bfa8' })
  hi('TelescopeResultsTitle',   { fg = '#19120d',             bg = '#c9ca94' })
  hi('TelescopeSelection',      { fg = '#f0dfd7',          bg = '#312823' })
  hi('TelescopeSelectionCaret', { fg = '#ffb786',             bg = '#312823' })
  hi('TelescopeMatching',       { fg = '#ffb786',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#f0dfd7',          bg = '#19120d' })
  hi('MiniPickBorder',         { fg = '#9f8d83',             bg = '#19120d' })
  hi('MiniPickPrompt',   { fg = '#f0dfd7',          bg = '#19120d' })
  hi('MiniPickPromptPrefix',   { fg = '#ffb786',             bg = '#19120d' })
  hi('MiniPickBorderText',    { fg = '#19120d',             bg = '#ffb786' })
  hi('MiniPickMatchCurrent',      { fg = '#f0dfd7',          bg = '#312823' })
  hi('MiniPickPromptCaret', { fg = '#ffb786',             bg = '#312823' })
  hi('MiniPickMatchRanges',       { fg = '#ffb786',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
