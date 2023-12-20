local status_ok, zenmode = pcall(require, "zen-mode")
if not status_ok then
  return
end

-- local incline = require("incline")

zenmode.setup({
  window = {
    backdrop = 1,
    width = 0.60,
    height = 1,
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
      ruler = false,   -- Disables the ruler text in the cmd line area
      showcmd = false, -- Disables the command in the last line of the screen
      laststatus = 0,  -- Turn off the statusline in zen mode
    },
    twilight = { enabled = true },
    gitsigns = { enabled = false },
    kitty = {
      enabled = false,
      font = "+4", -- Font size increment
    },
  },
  on_open = function()
    -- incline.disable()
    -- vim.g.cmp_active = false
    -- vim.cmd([[LspStop]])
  end,
  on_close = function()
    -- incline.enable()
    -- vim.g.cmp_active = true
    -- vim.cmd([[LspStart]])
  end,
})
