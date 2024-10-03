return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  enabled = false,
  opts = {
    indent = {
      char = "╎",
      tab_char = "╎",
    },
  },
  keys = {
    {
      "<leader>ti",
      ":IBLToggle<CR>",
      desc = "Toggle indent blankline",
      silent = true,
    },
  },
}
