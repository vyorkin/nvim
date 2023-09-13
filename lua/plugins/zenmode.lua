local status_ok, zenmode = pcall(require, "zen-mode")
if not status_ok then
  return
end

zenmode.setup({
  window = {
    backdrop = 1,
    width = 0.4,
    height = 0.9,
    options = {
      signcolumn = "no",
      number = false,
      relativenumber = false,
      cursorline = false,
      cursorcolumn = false,
      foldcolumn = "0",
    },
  },
  plugins = {
    options = {
      enabled = true,
      ruler = false, -- disables the ruler text in the cmd line area
      showcmd = false, -- disables the command in the last line of the screen
    },
    twilight = { enabled = false },
    gitsigns = { enabled = false },
    kitty = {
      enabled = false,
      font = "+4", -- font size increment
    },
  },
  on_open = function()
    -- vim.g.cmp_active = false
    -- vim.cmd([[LspStop]])
  end,
  on_close = function()
    -- vim.g.cmp_active = true
    -- vim.cmd([[LspStart]])
  end,
})
