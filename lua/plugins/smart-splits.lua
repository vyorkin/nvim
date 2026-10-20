-- Replaces Navigator.nvim (tmux-only, unmaintained since 2024) and
-- zellij-nav.nvim (was misconfigured with no keymaps, so Zellij navigation
-- never actually worked).
--
-- smart-splits.nvim v3 ships no multiplexer support in core: the tmux half
-- lives in a separate backend plugin. Without it, the keymaps below only move
-- between Neovim's own windows and stop dead at the edge.
--
-- The tmux half (fronted by tpm: smart-splits-nvim/backend-tmux) reads the
-- pane-local `@pane-is-vim` option this backend keeps truthful while Neovim
-- owns the pane, so tmux knows when to forward C-hjkl instead of moving panes.
-- Keep `move.at_edge` in step with `@smart-splits_at_edge` in tmux.conf.
--
-- Must not be lazy loaded: the option is only set once the plugin loads, and
-- until then tmux swallows C-hjkl and Neovim never sees them.
--
-- Out of tmux the tmux backend's detect() returns false, and smart-splits warns
-- "none of the configured backends detected" on every start. Nothing is broken
-- in that case — plain window movement is the right result — so the warning is
-- off; `:checkhealth smart-splits` still reports what happened to the backend.
return {
  {
    "smart-splits-nvim/smart-splits.nvim",
    lazy = false,
    priority = 1500,
    dependencies = {
      { "smart-splits-nvim/backend-tmux", main = "smart-splits-backend-tmux" },
    },
    opts = {
      mux = { backend = "smart-splits-backend-tmux", warn_if_unusable = false },
      move = { at_edge = "wrap" },
    },
    keys = {
      {
        "<C-h>",
        function()
          require("smart-splits").move_cursor_left()
        end,
        desc = "Go left",
      },
      {
        "<C-j>",
        function()
          require("smart-splits").move_cursor_down()
        end,
        desc = "Go down",
      },
      {
        "<C-k>",
        function()
          require("smart-splits").move_cursor_up()
        end,
        desc = "Go up",
      },
      {
        "<C-l>",
        function()
          require("smart-splits").move_cursor_right()
        end,
        desc = "Go right",
      },
    },
  },
}
