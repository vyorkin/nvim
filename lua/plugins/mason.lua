-- Mason's `ensure_installed` is assembled by appending to one list from every
-- LazyVim extra (clangd, docker, go, haskell, python, terraform, ...), and two of
-- them ask for the same package: rust and clangd both want `codelldb`. A
-- duplicate is not merely wasted work. mason.nvim's startup loop calls
-- `Package:install()` for every entry that is not installed yet, and installing a
-- package whose install is still in flight hits `assert(not self:is_installing())`
-- in mason-core/package/init.lua. That error aborts the whole loop, so every
-- server after the duplicate stays uninstalled and the failure surfaces once per
-- startup as "Failed to run config for mason.nvim".
--
-- So dedupe the list, and drop the packages Mason must not install here:
--
--   haskell-language-server  comes from ghcup 2.14.0.0, and a Mason copy in
--                            ~/.local/share/nvim/mason/bin would shadow it, that
--                            directory preceding ~/.ghcup/bin on PATH
--   haskell-debug-adapter    stays with Mason on purpose: 0.0.42.0 (the last
--                            release, March 2025) does not build on GHC 9.10.3 —
--                            it needs `hie-bios`, and the versions old enough for
--                            its API (<= 0.13.x) require ghc < 9.9
--
-- HLS comes from ghcup's default channel (`ghcup install hls <version>`). On
-- aarch64 its bindists are built on Debian 12, while ghcup hands an Arch host the
-- deb10 GHC bindist — a GHC pair that fails with "GHC ABIs don't match!". Ghc
-- 9.12.4 is the version whose aarch64 deb12 bindist is installed here to match,
-- installed by URL because the metadata maps Linux_UnknownLinux to deb10:
--   ghcup install ghc -u <ghc-9.12.4-aarch64-deb12-linux.tar.xz> 9.12.4 --set
return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      local skip = { ["haskell-language-server"] = true }
      local seen, list = {}, {}
      for _, pkg in ipairs(opts.ensure_installed or {}) do
        if not skip[pkg] and not seen[pkg] then
          seen[pkg] = true
          list[#list + 1] = pkg
        end
      end
      opts.ensure_installed = list
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- The registry ships no clangd build for aarch64 ("The current platform
        -- is unsupported."), so let Mason skip it: pacman's clang package already
        -- puts /usr/bin/clangd on PATH, and marking the server non-Mason also
        -- enables it directly instead of waiting for a Mason install.
        clangd = { mason = false },
      },
    },
  },
}
