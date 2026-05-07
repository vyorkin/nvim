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
      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN] = "W",
            [vim.diagnostic.severity.INFO] = "i",
            [vim.diagnostic.severity.HINT] = "h",
          },
        },
      })
    end,
  },
}
