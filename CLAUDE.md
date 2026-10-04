# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration built on **LazyVim** (lazyvim.org). All config is Lua.

## Structure

- `init.lua` — Entry point, loads `config.lazy`
- `lua/config/` — Core settings: `lazy.lua` (bootstrap), `options.lua`, `keymaps.lua`, `autocmds.lua` (auto-loaded by LazyVim on `VeryLazy`), `neovide.lua`
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
- **System appearance detection**: automatically switches between "cold" (dark) and "inspired-github" (light) colorschemes based on macOS appearance
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
