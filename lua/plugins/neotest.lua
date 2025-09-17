return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "mrcjkb/rustaceanvim",
      "lawrence-laz/neotest-zig",
      "llllvvuu/neotest-foundry",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
    },
    config = function()
      require("neotest").setup({
        log_level = vim.log.levels.TRACE,
        adapters = {
          -- Registration
          require("neotest-zig")({
            dap = {
              adapter = "lldb",
            },
          }),
          require("rustaceanvim.neotest"),
          require("neotest-foundry"),
        },
      })
    end,
  },
}
