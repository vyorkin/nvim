-------------------------------------------------------------------------------
-- Aliases
-------------------------------------------------------------------------------

local opt = vim.opt
local g = vim.g
local api = vim.api

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
opt.guifont = { "FiraCode Nerd Font Mono", ":h16" }
-- opt.guifont = { "Hack Nerd Font Mono", ":h16" }
-- opt.guifont = { "JetBrains Mono", ":h16" }
-- opt.guifont = { "JetBrainsMono Nerd Font", ":h16" }
-- opt.guifont = { "CozetteVector", ":h16" }
-- opt.guifont = { "Greybeard 16px", ":h16" }
-- opt.guifont = { "Retro Pixel Arcade", ":h16" }
-- opt.guifont = { "Ark Pixel 16px Monospaced latin", ":h16" }

-- Always show tabs
opt.showtabline = 2

-- Hide statusline
opt.laststatus = 0

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
  vert = " ",
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
-- 0 - Hide
-- 1 - Show, size = 1
opt.foldcolumn = "0"

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
  g.neovide_floating_blur_amount_x = 4.0
  g.neovide_floating_blur_amount_y = 4.0

  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5

  g.neovide_scroll_animation_length = 0.2
  g.neovide_cursor_animation_length = 0.1

  g.neovide_theme = "auto"
  g.neovide_refresh_rate = 60
  -- g.neovide_fullscreen = true

  g.neovide_padding_top = 2
  g.neovide_padding_bottom = 2
  g.neovide_padding_right = 2
  g.neovide_padding_left = 2

  g.neovide_hide_mouse_when_typing = false
  g.neovide_remember_window_size = true
  g.neovide_input_macos_option_key_is_meta = true

  g.neovide_cursor_animate_command_line = false

  -- g.neovide_cursor_vfx_mode = ""
  -- g.neovide_cursor_vfx_mode = "pixiedust"
  g.neovide_cursor_vfx_mode = "wireframe"
  g.neovide_cursor_vfx_opacity = 120.0
  g.neovide_cursor_vfx_particle_lifetime = 5.0
  g.neovide_cursor_vfx_particle_density = 120.0
  g.neovide_cursor_vfx_particle_speed = 80.0
  g.neovide_cursor_vfx_particle_phase = 1.5
  g.neovide_cursor_vfx_particle_curl = 1.0

  g.neovide_window_blurred = true
  g.neovide_show_border = true

  g.neovide_scale_factor = 1.0

  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.1)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.1)
  end)

  local transparency = 1.0

  -- Helper function for transparency formatting
  local alpha = function()
    return string.format(
      "%x",
      math.floor(255 * (vim.g.transparency or transparency))
    )
  end

  -- Set transparency and background color (title bar color)
  g.neovide_transparency = 1.0
  -- g.transparency = transparency
  -- g.neovide_background_color = "#0f1117" .. alpha()
  -- g.neovide_transparency_point = 0.9

  -- Force neovide to redraw all the time.
  -- This can be a quick hack if animations appear to stop too early.
  -- g.neovide_no_idle = true

  local setup_transparency = function()
    -- Helper function for transparency formatting
    local alpha = function()
      return string.format(
        "%x",
        math.floor(255 * (g.neovide_transparency_point or 0.9))
      )
    end

    local get_current_background_color = function()
      -- Get the highlight information for the specified group
      local bg_rgb = api.nvim_get_hl_by_name("Normal", true).background
          or 000000
      -- Extract the background color from the highlight information
      local bg_hex = string.format("#%x", bg_rgb)
      -- Add alpha
      return bg_hex .. alpha()
    end

    g.neovide_background_color = "#0f1117" -- get_current_background_color()

    -- Add keybinds to change transparency
    local change_transparency = function(delta)
      local a = vim.g.neovide_transparency + delta
      g.neovide_transparency = a
      g.neovide_transparency_point = a
      g.neovide_background_color = get_current_background_color()
    end

    vim.keymap.set({ "n", "v", "o" }, "<D-]>", function()
      change_transparency(0.01)
      vim.cmd("redraw")
    end)
    vim.keymap.set({ "n", "v", "o" }, "<D-[>", function()
      change_transparency(-0.01)
      vim.cmd("redraw")
    end)
  end

  -- setup_transparency()

  -- vim.cmd([[
  --   autocmd ColorScheme * lua setup_transparency()
  -- ]])
end
