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

keymap(
  "n",
  "<leader>tw",
  ":set invwrap<CR>:set wrap?<CR>",
  { desc = "Toggle text wrap" }
)

-- Start external command with single bang
keymap("n", "!", ":!", { noremap = true, desc = "External command" })

-- Easier increment/decrement
keymap("n", "+", "<C-a>", { desc = "Increment number" })
keymap("n", "-", "<C-x>", { desc = "Decrement number" })

keymap("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-------------------------------------------------------------------------------
-- Navigation
-------------------------------------------------------------------------------

-- Make 0 go to the first character rather than the beginning of the line
keymap("n", "0", "^", { desc = "Move to the first character" })
keymap("n", "^", "0", { desc = "Move the the beginning of the line" })

-------------------------------------------------------------------------------
-- Splits
-------------------------------------------------------------------------------

-- Creating
keymap(
  "n",
  "<leader>v",
  "<C-W>v",
  { remap = true, desc = "Split window right" }
)
keymap(
  "n",
  "<leader>s",
  "<C-W>s",
  { remap = true, desc = "Split window below" }
)
