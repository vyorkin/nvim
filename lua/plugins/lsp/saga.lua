local status_ok, saga = pcall(require, "lspsaga")
if not status_ok then
  return
end

saga.setup({
  lightbulb = {
    enable = true,
    enable_in_insert = false,
    sign = false,
    sign_priority = 40,
    virtual_text = true,
  },
  hover = {
    max_width = 0.6,
    open_link = "gx",
    open_browser = "!chrome",
  },
})
