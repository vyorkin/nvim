local status_ok, whichkey = pcall(require, "whichkey")
if not status_ok then
  return
end

whichkey.setup({})
