-------------------------------------------------------------------------------
-- Aliases
-------------------------------------------------------------------------------

local opt = vim.opt
local g = vim.g

-------------------------------------------------------------------------------
-- General
-------------------------------------------------------------------------------

-- Enable mouse (in all modes)
opt.mouse = "a"

-- Allow backspace in insert mode
opt.backspace = { "indent", "eol", "start" }

-- Use system clipboard for yanks
opt.clipboard = "unnamedplus"

-- Having longer updatetime (default is 4000 ms = 4s)
-- leads to noticeable delays and poor user experience
opt.updatetime = 250

-- Use short messages:
-- Skip :intro
-- Truncate file msg to fit on the cmd line
-- Don't pass messages to ins-completion-menu
opt.shortmess = "catIO"

-- Briefly jump to the matching bracket
opt.showmatch = true

-- How long to show matching paren
opt.matchtime = 1

-- Time in milliseconds to wait for a key code sequence to complete.
opt.timeoutlen = 400

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-------------------------------------------------------------------------------
-- Appearance
-------------------------------------------------------------------------------

-- Always show the signcolumn, otherwise it would
-- shift the text each time diagnostics appear/become resolved
opt.signcolumn = "yes"

-- Enable 24-bit colors
opt.termguicolors = true

-- Make popup menu smaller
opt.pumheight = 10

-- The font used in graphical neovim applications
opt.guifont = { "FiraCode Nerd Font Mono", ":h14" }

-- Always show tabs
opt.showtabline = 2

-------------------------------------------------------------------------------
-- Scroll
-------------------------------------------------------------------------------

-- Minimal number of screen lines to keep above and below the cursor
opt.scrolloff = 8

-- The minimal number of screen columns to keep to
-- the left and to the right of the cursor if 'nowrap' is set
opt.sidescrolloff = 8

-------------------------------------------------------------------------------
-- Indentations
-------------------------------------------------------------------------------

-- Keep tabstop on 8, set softtabstop to 2

-- Copy indent from current line when starting a new line
opt.autoindent = true

-- Enable smart indent
opt.smartindent = true

-- Use shiftwidth to insert blanks on <Tab>
-- in front of a line, same for <BS>
opt.smarttab = true

-- Number of spaces to use for each (auto)indent
opt.shiftwidth = 2

-- Number of spaces that a <Tab> counts for
-- edit operations (treat 2 spaces like a real <Tab>)
opt.softtabstop = 2

-- Always insert spaces instead of tabs
opt.expandtab = true

-- Round indent when shifting
opt.shiftround = true

-------------------------------------------------------------------------------
-- Search
-------------------------------------------------------------------------------

-- Ignore case when searching
opt.ignorecase = true

-- Override ignorecase if the search pattern contains upper case letters
opt.smartcase = true

-- Highlight search matches
opt.hlsearch = true

-------------------------------------------------------------------------------
-- Windows, Splits
-------------------------------------------------------------------------------

opt.fillchars = {
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
}

-- Don't squeeze window too much
opt.winwidth = 20
opt.winminwidth = 20

-- Put a new window below the current one
opt.splitbelow = true

-- Put a new window on the right side
opt.splitright = true

-------------------------------------------------------------------------------
-- Numbers
-------------------------------------------------------------------------------

-- Min number of columns to use for the line numbers
opt.numberwidth = 4

-- Don't show the line and column number of the
-- cursor position, separated by a comma
opt.ruler = false

-- Turn off line numbers
opt.number = false

-- Turn off relative numbers
opt.relativenumber = false

-------------------------------------------------------------------------------
-- Folding
-------------------------------------------------------------------------------

-- Column on the left that indicates open and closed folds
opt.foldcolumn = "1"

-- Using ufo provider need a large value
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-------------------------------------------------------------------------------
-- Wrap
-------------------------------------------------------------------------------

-- Don't wrap long lines
opt.wrap = false

-- Use "breakat" to decide when to wrap long lines
opt.linebreak = true

-- Allow wrap while moving with space,
-- backspace, arrows (in normal & insert modes)
opt.whichwrap = "b,s,<,>,[,]"

-- Maximum width of text (useful for formatting with gq)
opt.textwidth = 80

-- Format options that doesn't suck
opt.formatoptions = "qlcrnj1"

-------------------------------------------------------------------------------
-- Wrap
-------------------------------------------------------------------------------

-- Don't show the current mode (insert/visual/replace)
opt.showmode = false

-------------------------------------------------------------------------------
-- History, Temporary files
-------------------------------------------------------------------------------

-- Enable persistent undo
opt.undofile = true

-- Turn off swap files & backups
opt.swapfile = false
opt.writebackup = false

-------------------------------------------------------------------------------
-- Neovide
-------------------------------------------------------------------------------

if g.neovide then
  g.neovide_transparency = 1.0
  g.transparency = 1.0

  -- g.neovide_transparency = 0.85
  -- g.transparency = 0.85

  g.neovide_floating_blur_amount_x = 3.0
  g.neovide_floating_blur_amount_y = 3.0

  g.neovide_scroll_animation_length = 0.5

  g.neovide_theme = "auto"

  g.neovide_hide_mouse_when_typing = true
  g.neovide_remember_window_size = true
  g.neovide_input_macos_alt_is_meta = true

  g.neovide_cursor_vfx_mode = "wireframe"
  g.neovide_cursor_vfx_opacity = 200.0
  g.neovide_cursor_vfx_particle_lifetime = 1.8
  g.neovide_cursor_vfx_particle_density = 14.0
  g.neovide_cursor_vfx_particle_speed = 6.0
  g.neovide_cursor_vfx_particle_phase = 1.5
  g.neovide_cursor_vfx_particle_curl = 1.0
end
