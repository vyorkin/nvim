return {
  {
    "folke/snacks.nvim",
    opts = {
      bigfile = { enabled = true },
      quickfile = { enabled = true },
      dashboard = { enabled = false },
      scroll = { enabled = false },
      indent = { enabled = false },
      input = { enabled = true },
      notifier = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      picker = { enabled = true },
      -- I prefer neo-tree because it has no issues with Tmux and
      -- simplier split-related key bindings
      explorer = { enabled = false },
    },
  },
}
