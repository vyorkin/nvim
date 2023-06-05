local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = true,
  always_visible = true,
}

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

local filetype = {
  "filetype",
  icons_enabled = false,
}

local location = { "location", separator = { right = "" }, left_padding = 2 }

local colors = {
  blue = "#AE81FF",
  yellow = "#FFCB6B",
  black = "#263238",
  white = "#d6d6d6",
  red = "#ff5189",
  grey = "#000000",
}

local theme = {
  normal = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.yellow },
  },
  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.yellow } },
  replace = { a = { fg = colors.white, bg = colors.red } },
  inactive = {
    a = { fg = colors.white },
    b = { fg = colors.white },
    c = { fg = colors.white },
  },
}

lualine.setup({
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = theme,
    -- theme = "auto",

    component_separators = "|",
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {
      { "mode", separator = { left = "" }, right_padding = 2 },
    },
    lualine_b = {},
    lualine_c = { diagnostics },
    lualine_x = {},
    lualine_y = {
      { "diff", source = diff_source },
      "encoding",
      filetype,
    },
    lualine_z = { location },
  },
})
