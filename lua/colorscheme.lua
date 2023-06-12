-- local colorscheme = "github_light"
-- local colorscheme = "crimson_moonlight"
local colorscheme = "material"

vim.g.moonflyTransparent = true
vim.g.moonflyWinSeparator = 2

local material_status_ok, material = pcall(require, "material")
if material_status_ok and colorscheme == "material" then
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
      -- "dap",
      -- "dashboard",
      "gitsigns",
      -- "hop",
      "indent-blankline",
      "lspsaga",
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
      colored_cursor = false, -- Disable the colored cursor
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
if boo_status_ok and colorscheme == "forest_stream" then
  boo.use({ theme = "forest_stream" })
end

local synthwave84_status_ok, synthwave84 = pcall(require, "synthwave84")
if synthwave84_status_ok then
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

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

vim.g.tokyodark_enable_italic_comment = false
vim.g.tokyodark_enable_italic = false
vim.g.tokyodark_color_gamma = "1.0"
