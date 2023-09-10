local status_ok, smartcolumn = pcall(require, "smartcolumn")
if not status_ok then
  return
end

smartcolumn.setup({
  colorcolumn = "120",
  disabled_filetypes = { "help", "text", "markdown" },
  custom_colorcolumn = {},
  scope = "file",
})
