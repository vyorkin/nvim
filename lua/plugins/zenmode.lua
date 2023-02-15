local status_ok, zenmode = pcall(require, "zenmode")
if not status_ok then
  return
end

zenmode.setup({
  window = {
    width = 0.85,
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
    twilight = { enabled = false },
    gitsigns = { enabled = false },
  },
})
