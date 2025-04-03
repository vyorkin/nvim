return {
  "GR3YH4TT3R93/zellij-nav.nvim",
  cond = os.getenv("ZELLIJ") == "0", -- Only load plugin if in active Zellij instance
  event = "VeryLazy", -- Lazy load plugin for improved startup times
  init = function() -- Only needed if you want to override default keymaps otherwise just call opts = {}
    vim.g.zellij_nav_default_mappings = false -- Default: true
  end,
  opts = {}, -- Optional
  keys = {}, -- define your own keymaps e.g keys = { { "<C-h>", "<cmd>ZellijNavigateUp<CR>", { silent = true, desc = "Move to Zellij pane up" } } }
}
