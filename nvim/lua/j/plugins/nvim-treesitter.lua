return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local parsers = { "c", "lua", "vim", "vimdoc", "rust", "go", "cpp", "javascript", "html" }

    require("nvim-treesitter").setup()
    require("nvim-treesitter").install(parsers)

    -- The `main` branch no longer enables highlighting/indent automatically.
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        local started = pcall(vim.treesitter.start)
        if started then
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
