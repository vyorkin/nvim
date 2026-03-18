return {
  {
    "mrcjkb/rustaceanvim",
    -- version = "^6", -- Recommended
    opts = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            procMacro = {
              ignored = {
                ["async-trait"] = vim.NIL,
              },
            },
          },
        },
      },
    },
  },
}
