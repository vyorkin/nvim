-- LazyVim's lang.haskell extra adds `haskell-language-server` (needs ghcup) and
-- `haskell-debug-adapter` (needs cabal) to Mason's `ensure_installed`. Neither
-- tool exists on this machine, so Mason retried both on every startup, failed
-- with exit code 127, and aborted the installs while quitting ("Neovim is
-- exiting while packages are still installing").
--
-- Filter them out instead of installing a GHC toolchain that nothing here uses.
-- The rest of the extra stays (treesitter parser, haskell-tools.nvim, snippets),
-- so adding ghcup and cabal later plus removing this file is all it takes to get
-- HLS back.
return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      local unusable = { "haskell-language-server", "haskell-debug-adapter" }
      opts.ensure_installed = vim.tbl_filter(function(pkg)
        return not vim.tbl_contains(unusable, pkg)
      end, opts.ensure_installed or {})
    end,
  },
}
