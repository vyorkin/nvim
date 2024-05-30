local colorscheme_light = "github_light"
local colorscheme_dark = "material-palenight"
-- local colorscheme_dark = "sunbather"

vim.o.background = "dark"

if colorscheme_dark == "moonfly" then
  vim.g.moonflyTransparent = true
  vim.g.moonflyWinSeparator = 2
  vim.g.moonflyItalics = false
end

if colorscheme_dark == "thematrix" then
  -- Enable telescope theme
  vim.g.thematrix_telescope_theme = 1
  -- Enable transparent mode
  -- vim.g.thematrix_transparent_mode = 1

  vim.g.thematrix_function_style = "NONE"
  vim.g.thematrix_keyword_style = "italic"
end

local kimbox_status_ok, kimbox = pcall(require, "kimbox")
if kimbox_status_ok and colorscheme_dark == "kimbox" then
  kimbox.setup()
end

local fluoromachine_status_ok, fluoromachine = pcall(require, "fluoromachine")
if fluoromachine_status_ok and colorscheme_dark == "fluoromachine" then
  fluoromachine.setup({
    glow = true,
    theme = "fluoromachine",
  })
end

local catppuccin_status_ok, catppuccin = pcall(require, "catppuccin")
if catppuccin_status_ok and colorscheme_dark == "catppuccin" then
  catppuccin.setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    term_colors = true,
    transparent_background = false,
    no_italic = true,
    no_bold = false,
    styles = {
      comments = {},
      conditionals = {},
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
    },
    color_overrides = {
      mocha = {
        base = "#000000",
        mantle = "#000000",
        crust = "#000000",
      },
    },
    highlight_overrides = {
      mocha = function(C)
        return {
          TabLineSel = { bg = C.pink },
          CmpBorder = { fg = C.surface2 },
          Pmenu = { bg = C.none },
          TelescopeBorder = { link = "FloatBorder" },
        }
      end,
    },
  })
end

local set_dark = function()
  vim.api.nvim_set_option("background", "dark")

  local material_status_ok, material = pcall(require, "material")
  if material_status_ok and colorscheme_dark == "material" then
    vim.g.material_style = "darker"
    material.setup({
      contrast = {
        terminal = false, -- Enable contrast for the built-in terminal
        sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = false, -- Enable contrast for floating windows
        cursor_line = false, -- Enable darker background for the cursor line
        non_current_windows = false, -- Enable darker background for non-current windows
        filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
      },
      styles = {
        -- Give comments style such as bold, italic, underline etc.
        comments = { --[[ italic = true ]]
        },
        strings = { --[[ bold = true ]]
        },
        keywords = { --[[ underline = true ]]
        },
        functions = { --[[ bold = true, undercurl = true ]]
        },
        variables = {},
        operators = {},
        types = {},
      },
      plugins = { -- Uncomment the plugins that you use to highlight them
        -- Available plugins:
        "dap",
        -- "dashboard",
        "gitsigns",
        -- "hop",
        "indent-blankline",
        -- "mini",
        "neogit",
        "nvim-cmp",
        -- "nvim-navic",
        "nvim-tree",
        "nvim-web-devicons",
        -- "sneak",
        "telescope",
        "trouble",
        -- "which-key",
      },
      disable = {
        colored_cursor = true, -- Enable the colored cursor
        borders = true, -- Disable borders between verticaly split windows
        background = true, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
        term_colors = false, -- Prevent the theme from setting terminal colors
        eob_lines = false, -- Hide the end-of-buffer lines
      },
      high_visibility = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = false, -- Enable higher contrast text for darker style
      },
      lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )
      async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
      custom_colors = nil, -- If you want to everride the default colors, set this to a function
      custom_highlights = {}, -- Overwrite highlights with your own
    })
  end

  local boo_status_ok, boo = pcall(require, "boo-colorscheme")
  if boo_status_ok and colorscheme_dark == "forest_stream" then
    boo.use({ theme = "forest_stream" })
  end

  local synthwave84_status_ok, synthwave84 = pcall(require, "synthwave84")
  if synthwave84_status_ok and colorscheme_dark == "synthwave84" then
    synthwave84.setup({
      glow = {
        error_msg = true,
        type2 = true,
        func = true,
        keyword = true,
        operator = false,
        buffer_current_target = true,
        buffer_visible_target = true,
        buffer_inactive_target = true,
      },
    })
  end

  if colorscheme_dark == "tokyonight" then
    require("tokyonight").setup({
      style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      light_style = "day", -- The theme is used when the background is set to light
      transparent = false, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = false },
        keywords = { italic = false },
        functions = {},
        variables = {},
        -- Background styles.
        -- Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
      },
      sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
      day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
      hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
      dim_inactive = false, -- Dims inactive windows
      lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

      --- You can override specific color groups to use other groups or a hex color
      --- function will be called with a ColorScheme table
      on_colors = function(_colors) end,

      --- You can override specific highlights to use other groups or a hex color
      --- function will be called with a Highlights and ColorScheme table
      --- Borderless prompts for Telescope
      on_highlights = function(hl, c)
        local prompt = "#2d3149"
        hl.TelescopeNormal = {
          bg = c.bg_dark,
          fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopePromptNormal = {
          bg = prompt,
        }
        hl.TelescopePromptBorder = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePromptTitle = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePreviewTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopeResultsTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
      end,
    })
  end

  if colorscheme_dark == "tokyodark" then
    vim.g.tokyodark_enable_italic_comment = false
    vim.g.tokyodark_enable_italic = false
    vim.g.tokyodark_color_gamma = "1.0"
  end

  pcall(vim.cmd, "colorscheme " .. colorscheme_dark)
end

local set_light = function()
  vim.api.nvim_set_option("background", "light")
  pcall(vim.cmd, "colorscheme " .. colorscheme_light)
end

if vim.o.background == "dark" then
  set_dark()
else
  set_light()
end
