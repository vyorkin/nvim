-- Replaces Navigator.nvim (tmux-only, unmaintained since 2024) and
-- zellij-nav.nvim (was misconfigured with no keymaps, so Zellij navigation
-- never actually worked). smart-splits.nvim auto-detects Tmux, Zellij,
-- WezTerm, and Kitty, so a single set of keymaps works across all of them.
return {
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    priority = 1500,
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
