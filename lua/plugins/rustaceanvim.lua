return {
  -- LazyVim auto-enables LSP inlay hints per filetype (`lsp.opts.inlay_hints`)
  -- and rust-analyzer provides them by default, so rust buffers open with
  -- type/parameter hints. Exclude `rust` here: hints stay off until
  -- `<leader>uh` turns them on for the buffer.
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      inlay_hints = { exclude = { "vue", "rust" } },
    },
  },
  {
    "mrcjkb/rustaceanvim",
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
