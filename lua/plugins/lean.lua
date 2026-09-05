return {
  {
    "Julian/lean.nvim",
    event = { "BufReadPre *.lean", "BufNewFile *.lean" },

    -- `require("lean").setup()` is deprecated (removed in v2026.9.1); lean.nvim
    -- now reads its config from `vim.g.lean_config`, set before the plugin's
    -- own `plugin/lean.lua` runs.
    init = function()
      ---@type lean.Config
      vim.g.lean_config = {
        mappings = true,
        goal_markers = {
          accomplished = "ok",
          unsolved = " ~ ",
        },
      }
    end,

    config = function()
      -- Defer so we run after LazyVim's nvim-lspconfig config (which also calls
      -- vim.diagnostic.config and would otherwise overwrite our settings).
      vim.schedule(function()
        local severity = vim.diagnostic.severity
        local chars = { [severity.ERROR] = "E", [severity.WARN] = "W", [severity.INFO] = "i", [severity.HINT] = "h" }
        vim.diagnostic.config({
          signs = { text = chars },
          virtual_text = {
            prefix = function(d)
              return chars[d.severity] or ">"
            end,
          },
        })
      end)
    end,
  },
}
