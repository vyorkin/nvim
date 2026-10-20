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
      -- Lua callback per visible line on every redraw; with numbers off and
      -- `foldcolumn = "0"` it renders nothing worth the cost.
      statuscolumn = { enabled = false },
      -- Highlights other occurrences of the word under the cursor: extmarks plus
      -- an LSP-ish scan on a 200 ms debounce, i.e. constant background work
      -- while scrolling. Rollback: `enabled = true`.
      words = { enabled = false },
      picker = { enabled = true },
      -- I prefer neo-tree because it has no issues with Tmux and
      -- simplier split-related key bindings
      explorer = { enabled = false },
    },
  },
}
