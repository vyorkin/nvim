-- Gets macOS appearance
local function get_appearance()
  local handle = io.popen("osascript ~/.config/nvim/scripts/get_appearance.scpt")
  local result = handle:read("*a")
  handle:close()
  return result:match("^%s*(.-)%s*$")
end

-- Set background based on macOS appearance
local appearance = get_appearance()

return {
  {
    "gmr458/cold.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      if appearance == "dark" then
        vim.cmd([[colorscheme cold]])
        vim.o.background = "dark"
      end
    end,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      if appearance == "light" then
        vim.cmd([[colorscheme gruvbox-material]])
        vim.o.background = "light"
      end
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
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
      day_brightness = 0.3,
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
