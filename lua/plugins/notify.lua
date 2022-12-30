local status_ok, notify = pcall(require, "notify")
if not status_ok then
  return
end

notify.setup({
  stages = "slide",
  level = "WARN",
  background_colour = vim.g.terminal_color_background,
  minimum_width = 15,
})
