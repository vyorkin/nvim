return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      backdrop = 0.95,
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
  },

  keys = {
    { "<leader><enter>", ":ZenMode<CR>", desc = "Toggle zen mode", silent = true },
  },
}
