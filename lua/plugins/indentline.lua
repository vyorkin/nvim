local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

indent_blankline.setup({
  char = "¦",

  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  use_treesitter = true,
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = false,
  buftype_exclude = { "terminal", "nofile" },

  filetype_exclude = {
    "help",
    "packer",
    "NvimTree",
    "Trouble",
    "trouble",
    "noice",
    "help",
    "mason.nvim",
  },
})
