return {
  "mrcjkb/rustaceanvim",
  version = "^6", -- Recommended
  lazy = false,
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
}
