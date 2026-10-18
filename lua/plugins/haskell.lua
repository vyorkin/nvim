-- haskell-language-server comes from ghcup instead of Mason, so filter it out of
-- Mason's `ensure_installed`; otherwise Mason drops a second, older copy into
-- ~/.local/share/nvim/mason/bin, which precedes ~/.local/bin on PATH and would
-- shadow the ghcup one.
--
--   haskell-language-server  2.15.0.0  ghcup, vanilla channel, wrapper in ~/.local/bin
--   haskell-debug-adapter    0.0.39.0  Mason
--
-- The debug adapter stays with Mason on purpose: 0.0.42.0 (the last release,
-- March 2025) does not build on GHC 9.10.3 — it needs `hie-bios`, and the
-- versions old enough for its API (<= 0.13.x) require ghc < 9.9.
--
-- Upgrading HLS: `ghcup --url-source=.../ghcup-vanilla-0.1.0.yaml install hls
-- <version>`, then point ~/.local/bin/haskell-language-server-wrapper at it.
return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(pkg)
        return pkg ~= "haskell-language-server"
      end, opts.ensure_installed or {})
    end,
  },
}
