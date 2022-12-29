local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = false,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width,
}

local filetype = {
  "filetype",
  icons_enabled = false,
}

local location = { "location", separator = { right = "" }, left_padding = 2 }

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local colors = {
  blue = "#80a0ff",
  cyan = "#79dac8",
  black = "#25283a",
  white = "#d6d6d6",
  red = "#ff5189",
  violet = "#d183e8",
  grey = "#404040",
}

local tokyonight_bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white },
    b = { fg = colors.white },
    c = { fg = colors.black },
  },
}

lualine.setup({
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = tokyonight_bubbles_theme,

    component_separators = "|",
    section_separators = { left = "", right = "" },

    disabled_filetypes = { "alpha", "dashboard" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {
      { "mode", separator = { left = "" }, right_padding = 2 },
    },

    lualine_b = { "filename", "branch" },
    lualine_c = { diagnostics },
    lualine_x = {},
    lualine_y = { diff, spaces, "encoding", filetype, "progress" },
    lualine_z = { location },
  },
})
