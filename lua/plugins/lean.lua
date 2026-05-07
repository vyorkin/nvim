return {
  {
    "Julian/lean.nvim",
    event = { "BufReadPre *.lean", "BufNewFile *.lean" },

    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    ---@type lean.Config
    opts = {
      mappings = true,
      goal_markers = {
        accomplished = "ok",
        unsolved = " ~ ",
      },
    },

    config = function(_, opts)
      require("lean").setup(opts)
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
