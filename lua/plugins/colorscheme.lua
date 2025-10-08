local function get_osx_system_appearance()
  local handle = io.popen("osascript ~/.config/nvim/scripts/get_appearance.scpt")
  local result = handle:read("*a")
  handle:close()
  return result:match("^%s*(.-)%s*$")
end

local use_system_appearance = true
local appearance_default = "dark"

local function get_linux_system_appearance()
  return appearance_default
end

local function get_windows_system_appearance()
  return appearance_default
end

local function get_system_appearance()
  local os_name = vim.loop.os_uname().sysname
  if os_name == "Darwin" then
    return get_osx_system_appearance()
  elseif os_name == "Linux" then
    return get_linux_system_appearance()
  else
    return get_windows_system_appearance()
  end
end

local system_appearance = get_system_appearance()
local colorscheme = (system_appearance == "dark" and "cold" or "inspired-github")

-- Uncomment to enable automatic background switching based on system appearance
if use_system_appearance then
  vim.o.background = system_appearance
else
  vim.o.background = appearance_default
end

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = colorscheme,
    },
  },
  {
    "antonio-hickey/minty-melon",
  },
  {
    "daenuprobst/lcarsoft",
  },
  {
    "ok-ryoko/blue-screen",
  },
  {
    "iruzo/matrix-nvim",
    config = function()
      vim.g.matrix_contrast = true
      vim.g.matrix_borders = false
      vim.g.matrix_disable_background = false
      vim.g.matrix_italic = false
    end,
  },
  {
    "luisiacc/the-matrix.nvim",
    config = function()
      vim.g.thematrix_function_style = "NONE"
      vim.g.thematrix_keyword_style = "NONE"
    end,
  },
  {
    -- My fork with no italic comments
    "vyorkin/inspired-github.vim",
  },
  {
    "Patagia/dieter.nvim",
  },
  {
    "water-sucks/darkrose.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      styles = {
        bold = true,
        italic = false,
        underline = true,
      },
    },
  },
  {
    "mikesmithgh/gruvsquirrel.nvim",
  },
  {
    "MetriC-DT/balance-theme.nvim",
  },
  {
    "steguiosaur/fullerene.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "wurli/cobalt.nvim",
    opts = {
      commentStyle = { italic = false },
      keywordStyle = { italic = false },
    },
  },
  {
    "Skullamortis/forest.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
    },
  },
  {
    "maxmx03/fluoromachine.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local fm = require("fluoromachine")

      fm.setup({
        glow = true,
        theme = "fluoromachine",
        transparent = false,
      })
    end,
  },
  { "scottmckendry/cyberdream.nvim" },
  { "oneslash/helix-nvim" },
  {
    "mellow-theme/mellow.nvim",
  },
  {
    "metalelf0/black-metal-theme-neovim",
    lazy = false,
    priority = 1000,
    config = function()
      require("black-metal").setup({
        -- Can be one of: bathory | burzum | dark-funeral | darkthrone | emperor | gorgoroth | immortal | impaled-nazarene | khold | marduk | mayhem | nile | taake | thyrfing | venom | windir
        theme = "bathory",
        -- Can be one of: 'light' | 'dark', or set via vim.o.background
        variant = "dark",
        -- Use an alternate, lighter bg
        alt_bg = false,
        code_style = {
          comments = "none",
        },
      })
    end,
  },
  {
    "datsfilipe/vesper.nvim",
    config = function()
      require("vesper").setup({
        transparent = true,
        italics = {
          comments = false,
          keywords = false,
          functions = false,
          strings = false,
          variables = false,
        },
        overrides = {}, -- A dictionary of group names, can be a function returning a dictionary or a table.
        palette_overrides = {},
      })
    end,
  },
  {
    "ptdewey/darkearth-nvim",
    priority = 1000,
  },
  {
    "hachy/eva01.vim",
    priority = 1000,
  },
  { "ronisbr/nano-theme.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  {
    "olivercederborg/poimandres.nvim",
    priority = 1000,
    config = function()
      require("poimandres").setup({
        disable_italics = true,
      })
    end,
  },
  {
    "vague2k/vague.nvim",
    config = function()
      require("vague").setup({
        style = {
          comments = "none",
          strings = "none",
          keyword_return = "none",
        },
        plugins = {
          dashboard = {
            footer = "italic",
          },
          lsp = {
            diagnostic_info = "none",
          },
        },
      })
    end,
  },
  {
    "0xstepit/flow.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("flow").setup({
        dark_theme = true,
        transparent = false,
        high_contrast = false,
        fluo_color = "pink",
        mode = "desaturate",
        aggressive_spell = false,
      })
    end,
  },
  {
    "t184256/vim-boring",
  },
  {
    "hardselius/warlock",
  },
  {
    "rost/vim-lesser",
  },
  {
    "kdheepak/monochrome.nvim",
  },
  {
    "vyorkin/cold.nvim",
    lazy = true,
    config = function()
      require("cold").setup({
        transparent_background = true,
      })
    end,
  },
  {
    "blazkowolf/gruber-darker.nvim",
    lazy = false,
    opts = {

      bold = true,
      invert = {
        signs = false,
        tabline = false,
        visual = false,
      },
      italic = {
        strings = false,
        comments = false,
        operators = false,
        folds = false,
      },
      undercurl = true,
      underline = true,
    },
  },
  {
    "navarasu/onedark.nvim",
    lazy = false,
    opts = {
      style = "cool",
      toggle_style_key = "<leader>uo",
      code_style = {
        comments = "none",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
      },
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = {
      italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
      },
    },
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
  },
  {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.zenbones_darken_comments = 45
      vim.g.zenbones_italic_comments = false
      vim.g.zenbones_italic_strings = false
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {
      styles = {
        transparent = true,
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = false },
        keywords = { italic = false },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
      },
      -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
      day_brightness = 0,
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    opts = {
      flavour = "auto", -- latte, frappe, macchiato, mocha
      transparent_background = false,
      no_italic = true,
    },
  },
  {
    "neanias/everforest-nvim",
  },
  {
    "navarasu/onedark.nvim",
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      styles = {
        bold = true,
        italic = false,
        transparency = false,
      },
    },
  },
  {
    "Mofiqul/vscode.nvim",
    opts = {
      transaparent = false,
      italic_comments = false,
    },
  },
  {
    "maxmx03/solarized.nvim",
    opts = {
      theme = "neo",
      styles = {
        comments = { italic = false, bold = false },
        functions = { italic = false },
        variables = { italic = false },
      },
    },
  },
  {
    "Verf/deepwhite.nvim",
  },
  {
    "NTBBloodbath/doom-one.nvim",
    lazy = false,
  },
  {
    "ribru17/bamboo.nvim",
    opts = {
      code_style = {
        comments = { italic = false },
        conditionals = { italic = false },
        keywords = {},
        functions = {},
        namespaces = { italic = false },
        parameters = { italic = false },
        strings = {},
        variables = {},
      },
    },
  },
  {
    "loctvl842/monokai-pro.nvim",
    opts = {
      transparent_background = false,
      devicons = true, -- highlight the icons of `nvim-web-devicons`
      styles = {
        comment = { italic = false },
        keyword = { italic = false }, -- any other keyword
        type = { italic = false }, -- (preferred) int, long, char, etc
        storageclass = { italic = false }, -- static, register, volatile, etc
        structure = { italic = false }, -- struct, union, enum, etc
        parameter = { italic = false }, -- parameter pass in function
        annotation = { italic = false },
        tag_attribute = { italic = false }, -- attribute of tag in reactjs
      },
      filter = "pro",
    },
  },
  {
    "sho-87/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      commentStyle = { italic = false },
      functionStyle = {},
      keywordStyle = { italic = false },
      statementStyle = { bold = true },
      typeStyle = {},
    },
  },
  {
    "aktersnurra/no-clown-fiesta.nvim",
    opts = {
      transparent = false,
    },
  },
}
