-------------------------------------------------------------------------------
-- Aliases
-------------------------------------------------------------------------------

-- Create/get autocommand group
local augroup = vim.api.nvim_create_augroup
-- Create autocommand
local autocmd = vim.api.nvim_create_autocmd

-------------------------------------------------------------------------------
-- General
-------------------------------------------------------------------------------

-- Remove whitespace on save
autocmd("BufWritePre", {
  pattern = "",
  command = ":%s/\\s\\+$//e",
})

-- Don't automatically put comments on new lines
autocmd("BufEnter", {
  pattern = "",
  command = "set fo-=c fo-=r fo-=o",
})

-------------------------------------------------------------------------------
-- File types
-------------------------------------------------------------------------------

vim.api.nvim_create_autocmd("FileType", {
  pattern = "solidity",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})
