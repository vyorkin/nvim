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

-- These mappings are just annoying. `keymap.del` raises E31 when a mode has no
-- mapping, and that error aborts the rest of this file — including the resize
-- mappings below — so every delete is guarded.
for _, mode in ipairs({ "n", "i", "v" }) do
  for _, key in ipairs({ "<A-j>", "<A-k>" }) do
    pcall(keymap.del, mode, key)
  end
end

-------------------------------------------------------------------------------
-- Window/pane resizing (smart-splits)
-------------------------------------------------------------------------------

-- Defined here rather than in lua/plugins/smart-splits.lua because this file
-- runs on VeryLazy, after startup plugins are loaded, and its deletes above
-- would otherwise wipe the <A-j>/<A-k> mappings a plugin spec had set.
-- Resizes Neovim's window; at the edge of Neovim, resizes the tmux pane.
-- The step matches @smart-splits_resize_step_size in tmux.conf.
for _, dir in ipairs({ "left", "down", "up", "right" }) do
  local key = ({ left = "<A-h>", down = "<A-j>", up = "<A-k>", right = "<A-l>" })[dir]
  keymap.set("n", key, function()
    require("smart-splits")["resize_" .. dir]()
  end, { desc = "Resize " .. dir })
end
