-- Replaced folke/zen-mode.nvim with snacks.nvim's built-in zen module
-- (same author, one fewer dependency; LazyVim already binds <leader>uz to
-- it, this just keeps the old <leader><enter> muscle memory working too).
return {
  {
    "folke/snacks.nvim",
    opts = {
      zen = {
        toggles = {
          git_signs = true,
        },
        win = {
          width = 0.7,
          height = 0.95,
          wo = {
            signcolumn = "no",
            number = false,
            relativenumber = false,
            cursorline = false,
            cursorcolumn = false,
            foldcolumn = "0",
            list = false,
          },
        },
        on_open = function()
          -- incline is disabled (see plugins/incline.lua); pcall keeps zen mode
          -- working either way, so re-enabling that plugin needs no change here.
          pcall(function()
            require("incline").disable()
          end)
        end,
        on_close = function()
          pcall(function()
            require("incline").enable()
          end)
        end,
      },
    },
    keys = {
      {
        "<leader><enter>",
        function()
          Snacks.zen()
        end,
        desc = "Toggle zen mode",
      },
    },
  },
}
