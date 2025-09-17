return {
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        backdrop = 1,
        width = 0.8,
        height = 0.95,
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = false,
          cursorcolumn = false,
          foldcolumn = "0",
          list = false,
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false, -- Disables the ruler text in the cmd line area
          showcmd = false, -- Disables the command in the last line of the screen
          laststatus = 0, -- Turn off the statusline in zen mode
        },
        gitsigns = { enabled = false },
      },
      on_open = function()
        vim.cmd(":lua require('incline').disable()")
      end,
      on_close = function()
        vim.cmd(":lua require('incline').enable()")
      end,
    },

    keys = {
      { "<leader><enter>", ":ZenMode<CR>", desc = "Toggle zen mode", silent = true },
    },
  },
}
