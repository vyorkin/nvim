-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-------------------------------------------------------------------------------
-- Aliases
-------------------------------------------------------------------------------

local keymap = vim.keymap.set

-------------------------------------------------------------------------------
-- General
-------------------------------------------------------------------------------

-- I hate holding <Shift> every time I need to enter a cmd
keymap("n", ";", ":", { noremap = true })
keymap("n", ":", ";", { noremap = true })
