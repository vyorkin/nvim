return {
  "numToStr/Navigator.nvim",
  priority = 1500,
  lazy = false,
  config = function()
    require("Navigator").setup()
  end,
  keys = {
    { "<C-l>", ":NavigatorRight<CR>", desc = "Go right", silent = true },
    { "<C-h>", ":NavigatorLeft<CR>", desc = "Go left", silent = true },
    { "<C-k>", ":NavigatorUp<CR>", desc = "Go up", silent = true },
    { "<C-j>", ":NavigatorDown<CR>", desc = "Go down", silent = true },
  },
}
