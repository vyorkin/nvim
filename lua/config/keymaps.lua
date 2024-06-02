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

keymap("n", "<leader>tw", ":set invwrap<CR>:set wrap?<CR>", { desc = "Toggle text wrap" })

function ToggleNumbers()
  local current = vim.wo.number
  if current then
    vim.wo.number = false
    vim.wo.relativenumber = false
  else
    vim.wo.number = true
    vim.wo.relativenumber = true
  end
end

keymap("n", "<leader>tn", ":lua ToggleNumbers()<CR>", { noremap = true, silent = true, desc = "Toggle line numbers" })
