-- Code annotations sent to herdr agents; pairs with the herdr-nvim herdr plugin.
--
-- The plugin's default keymaps live under <leader>a, where <leader>ac (comment)
-- and <leader>as (send) already belong to claude-code.nvim — it refuses to
-- override them and says so on every startup. <leader>ag is free, so the
-- annotations move there: <leader>agc comment, <leader>agl list,
-- <leader>ags send, <leader>agi reference.
return {
  {
    "ChmaraX/herdr-nvim",
    opts = { prefix = "<leader>ag" },
  },
}
