-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Fix unreadable highlight groups on the inspired-github light theme.
-- The theme leaves Operator/DiagnosticInfo undefined, causing Neovim's
-- built-in defaults (yellow/green) to bleed through into lean.nvim's infoview.
local function apply_inspired_github_hl()
  if vim.g.colors_name ~= "inspired-github" then
    return
  end
  -- Base groups missing from the theme (affect all plugins)
  vim.api.nvim_set_hl(0, "Operator",       { fg = "#a71d5d" }) -- same as Keyword
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#ca1243" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn",  { fg = "#e36209" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo",  { fg = "#115f93" }) -- same as Directory
  vim.api.nvim_set_hl(0, "DiagnosticHint",  { fg = "#795da3" }) -- same as Function
  -- lean.nvim infoview groups
  vim.api.nvim_set_hl(0, "leanInfoHypName",   { link = "Function" })  -- #795da3 purple
  vim.api.nvim_set_hl(0, "leanInfoGoalPrefix", { link = "Keyword" })   -- #a71d5d crimson
  vim.api.nvim_set_hl(0, "leanUnsolvedGoals",  { link = "DiagnosticInfo" })
  vim.api.nvim_set_hl(0, "leanProgressBar",    { fg = "#115f93" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "inspired-github",
  callback = apply_inspired_github_hl,
})

-- Apply immediately: autocommands.lua loads on VeryLazy, after the colorscheme
-- is already set, so the ColorScheme autocmd above won't fire on startup.
apply_inspired_github_hl()

-- Disable spell checking and concealing in markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.spell = false
    vim.opt_local.conceallevel = 0
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.md" },
  callback = function()
    vim.opt_local.spell = false
    vim.opt_local.conceallevel = 0
  end,
})
