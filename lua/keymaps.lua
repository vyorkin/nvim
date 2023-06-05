-------------------------------------------------------------------------------
-- Aliases
-------------------------------------------------------------------------------

local keymap = vim.api.nvim_set_keymap

-------------------------------------------------------------------------------
-- Variables
-------------------------------------------------------------------------------

local opts = { noremap = true, silent = true }

-------------------------------------------------------------------------------
-- General
-------------------------------------------------------------------------------

-- Use space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- I hate holding <Shift> every time I need to enter a cmd
keymap("n", ";", ":", { noremap = true })
keymap("n", ":", ";", { noremap = true })

-- Set text wrapping toggles
keymap("n", "<leader>tw", ":set invwrap<CR>:set wrap?<CR>", opts)

-- Start external command with single bang
keymap("n", "!", ":!", { noremap = true })

-- Easier increment/decrement
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", opts)

-- Reload configuration without restarting
keymap("n", "<leader>R", ":so %<CR>", opts)

-------------------------------------------------------------------------------
-- Navigation
-------------------------------------------------------------------------------

-- Make 0 go to the first character
-- rather than the beginning of the line
keymap("n", "0", "^", opts)
keymap("n", "^", "0", opts)

-- Go to last edit location
keymap("n", ",.", "'.", opts)

-- Jump to line and column by typing '<mark_char>
keymap("n", "'", "`", opts)
keymap("n", "`", "'", opts)

-- Remove search highlight markers by typing //
keymap("n", "//", ":nohlsearch<CR>", opts)

-- Open/close quickfix window faster
keymap("n", ",qc", ":cclose<CR>", opts)
keymap("n", ",qo", ":copen<CR>", opts)

-- Move back and forth through previous and next buffers with ,z and ,x
keymap("n", ",z", ":bp<CR>", opts)
keymap("n", ",x", ":bn<CR>", opts)

-- Easily move netween next and previous errors
keymap("n", "<leader>J", ":lnext<CR>", opts)
keymap("n", "<leader>K", ":lprevious<CR>", opts)

-- Nagivate between buffers easily
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-------------------------------------------------------------------------------
-- Splits
-------------------------------------------------------------------------------

-- Moving
keymap("n", "<C-l>", ":NavigatorRight<CR>", opts)
keymap("n", "<C-k>", ":NavigatorUp<CR>", opts)
keymap("n", "<C-j>", ":NavigatorDown<CR>", opts)
keymap("n", "<C-h>", ":NavigatorLeft<CR>", opts)

-- Creating
keymap("n", "<leader>v", "<C-w>v", opts)
keymap("n", "<leader>s", "<C-w>s", opts)

-- Resizing
keymap("n", "<C-M-j>", ":resize -2<CR>", opts)
keymap("n", "<C-M-k>", ":resize +2<CR>", opts)
keymap("n", "<C-M-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-M-l>", ":vertical resize +2<CR>", opts)

-------------------------------------------------------------------------------
-- Tabs
-------------------------------------------------------------------------------

keymap("n", "te", ":tabedit<CR>", opts)
keymap("n", "<M-h>", ":tabprevious<CR>", opts)
keymap("n", "<M-l>", ":tabnext<CR>", opts)

-------------------------------------------------------------------------------
-- Telescope
-------------------------------------------------------------------------------

keymap("n", "<C-q>", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>f", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>F", ":Telescope file_browser<CR>", opts)
keymap("n", "<C-b>", ":Telescope buffers<CR>", opts)
keymap("n", "<C-p>", ":Telescope projects<CR>", opts)
keymap("n", "<leader>T", ":Telescope colorscheme<CR>", opts)
keymap(
  "n",
  "<leader>m",
  ":lua require('material.functions').find_style()<CR>",
  opts
)
keymap("n", "<C-s>", ":Telescope lsp_document_symbols<CR>", opts)

-------------------------------------------------------------------------------
-- Tree
-------------------------------------------------------------------------------

keymap("n", "<leader>q", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>r", ":NvimTreeFindFile<CR>", opts)

-------------------------------------------------------------------------------
-- Trouble
-------------------------------------------------------------------------------

keymap("n", "<leader><leader>", ":TroubleToggle document_diagnostics<CR>", opts)

-------------------------------------------------------------------------------
-- ZenMode
-------------------------------------------------------------------------------

keymap("n", "<leader><enter>", ":ZenMode<CR>", opts)

-------------------------------------------------------------------------------
-- Marks
-------------------------------------------------------------------------------

keymap("n", "<leader>M", ":MarksListAll<CR>", opts)

-------------------------------------------------------------------------------
-- Git
-------------------------------------------------------------------------------

keymap("n", "<leader>gs", ":Neogit<CR>", opts)
keymap("n", "<leader>gb", ":Gitsigns blame_line<CR>", opts)
keymap("n", "<leader>S", ":Gitsigns toggle_signs<CR>", opts)
