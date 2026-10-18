# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration built on **LazyVim** (lazyvim.org). All config is Lua.

## Structure

- `init.lua` — Entry point, loads `config.lazy`
- `lua/config/` — Core settings: `lazy.lua` (bootstrap), `options.lua`, `keymaps.lua`, `autocmds.lua` (auto-loaded by LazyVim on `VeryLazy`), `neovide.lua`, `shada.lua`
- `lua/plugins/` — One file per plugin/concern, each returns a lazy.nvim plugin spec table
- `lazyvim.json` — Declares which LazyVim extras are enabled (languages, formatting, linting, DAP, etc.)
- `scripts/get_appearance.scpt` — AppleScript for macOS dark/light mode detection

## Formatting

Lua files are formatted with **StyLua**: 2-space indent, 120 column width. Config in `stylua.toml`.

## Key Architecture Decisions

- **LazyVim extras** handle most language support (Rust, Go, Haskell, OCaml, Python, TypeScript, Docker, Terraform, etc.) — avoid duplicating what extras already provide
- **blink.cmp** for completion (not nvim-cmp)
- **snacks.nvim** picker (not telescope)
- **incline.nvim** replaces bufferline and lualine (both disabled)
- Status line is hidden (`laststatus = 0`), no line numbers — minimal UI philosophy
- **System appearance detection**: automatically switches between "cold" (dark) and "inspired-github" (light) colorschemes based on macOS appearance. On Omarchy the Linux branch asks `config.omarchy.mode()` instead: it reads `mode` (or derives it from `background` brightness) out of the active theme's `colors.toml`, so light themes such as `catppuccin-latte` or `white` get `background = "light"` instead of dark highlight groups
- **Remote clipboard**: `lua/config/remote_clipboard.lua` (required from `options.lua`) sets `vim.g.clipboard` when the session is inside tmux, ssh or herdr — copies go to `wl-copy` locally and out as OSC 52, pastes prefer the Wayland clipboard. Omarchy enables both ends already (alacritty `osc52 = "CopyPaste"`, tmux `terminal-features ",*:clipboard"`). Plain local sessions are untouched
- **ShaDa on tmpfs**: Neovim writes ShaDa synchronously while quitting, and a btrfs transaction commit on this machine takes 0.2-3.7 s under load, so every quit blocked for ~0.5-1.2 s. `lua/config/shada.lua` (required from `options.lua`) points `shadafile` at `$XDG_RUNTIME_DIR`, seeds it from the persistent `~/.local/state/nvim/shada/main.shada` before Neovim reads it, and mirrors it back with a detached `cp` on `VimLeave`
- **smart-splits.nvim** for window navigation (`<C-h/j/k/l>`) — auto-detects Tmux, Zellij, WezTerm, and Kitty
- **UFO** for code folding with treesitter/indent providers
- Neotest configured with Rust, Zig, and Foundry adapters

## Plugin Configuration Pattern

Each file in `lua/plugins/` returns a list of plugin specs. To modify a plugin, find or create the relevant file and return a spec that merges with LazyVim defaults:

```lua
return {
  {
    "author/plugin",
    opts = { ... },  -- merged with defaults
  },
}
```

To disable a LazyVim default plugin, set `enabled = false` in its spec.

## External Tool Dependencies

- `npm install -g @mermaid-js/mermaid-cli`
- Mason: install `vscode-solidity-server` and `solhint` manually
- **Haskell**: `ghcup` (installed under `/data/share/.ghcup`, GHC 9.10.3 and its tools live in `/data/share/ghcup-store` with `~/.ghcup/{ghc,hls}` symlinked to keep the root fs free). `haskell-language-server` 2.15.0.0 comes from the ghcup vanilla channel, not Mason — `lua/plugins/haskell.lua` filters it out of `ensure_installed` so Mason's older copy cannot shadow it. `haskell-debug-adapter` 0.0.39.0 stays with Mason because 0.0.42.0 does not build on GHC 9.10. `fourmolu`, `hlint` and `cabal-fmt` are built with `cabal install --installdir=~/.local/bin` (cabal-fmt needs `--allow-newer=base`, its bounds stop at base 4.19)
- **OCaml**: one opam switch (`~/.opam/default`, OCaml 5.5.1) providing `ocamllsp` 1.27.0, `dune`, `ocamlformat`, `utop` and `ocamlearlybird`; its binaries are symlinked into `~/.local/bin` so GUI-launched Neovim sees them (`mason/bin` shadows nothing relevant). `lua/plugins/ocaml.lua` wires formatting (`ocamlformat`, `dune format-dune-file`), the Tarides `ocaml.nvim` Merlin features and the earlybird DAP adapter
- **Hoogle**: `hoogle` (cabal, `~/.local/bin`) with its database in `~/.hoogle`, a symlink to `/data/share/hoogle` to keep it off the root fs. `scripts/hoogle-generate.sh` rebuilds it from the packages in the cabal store (extra names can be passed as arguments); `lua/plugins/hoogle.lua` exposes it as a snacks picker source on `<localleader>H` and as `:Hoogle`, which is the snacks counterpart of the telescope-based `telescope_hoogle` that never loads here
