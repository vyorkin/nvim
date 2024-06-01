-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-------------------------------------------------------------------------------
-- Aliases
-------------------------------------------------------------------------------

local opt = vim.opt
local g = vim.g

-------------------------------------------------------------------------------
-- History, Temporary files
-------------------------------------------------------------------------------

-- Turn off swap files & backups
opt.swapfile = false
opt.writebackup = false

-------------------------------------------------------------------------------
-- Numbers
-------------------------------------------------------------------------------

-- Min number of columns to use for the line numbers
opt.numberwidth = 4

-------------------------------------------------------------------------------
-- Folding
-------------------------------------------------------------------------------

-- Column on the left that indicates open and closed folds
-- 0 - Hide
-- 1 - Show, size = 1
opt.foldcolumn = "0"

-- Using ufo provider need a large value
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-------------------------------------------------------------------------------
-- Appearance
-------------------------------------------------------------------------------

-- The font used in graphical neovim applications
opt.guifont = { "FiraCode Nerd Font Mono", ":h16" }

-------------------------------------------------------------------------------
-- Neovide
-------------------------------------------------------------------------------

if g.neovide then
  require("config.neovide")
end
