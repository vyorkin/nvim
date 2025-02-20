-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-------------------------------------------------------------------------------
-- Aliases
-------------------------------------------------------------------------------

local keymap = vim.keymap

-------------------------------------------------------------------------------
-- General
-------------------------------------------------------------------------------

-- I hate holding <Shift> every time I need to enter a cmd
keymap.set("n", ";", ":", { noremap = true })
keymap.set("n", ":", ";", { noremap = true })

-- These mappings are just annoying
keymap.del({ "n", "i", "v" }, "<A-j>")
keymap.del({ "n", "i", "v" }, "<A-k>")
