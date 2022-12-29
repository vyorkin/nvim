local status_ok, zenmode = pcall(require, "zenmode")
if not status_ok then
  return
end

zenmode.setup {
  window = {
    width = 0.85
  }
}
