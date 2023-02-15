-- local synthwave84_status_ok, synthwave84 = pcall(require, "synthwave84")
-- if not synthwave84_status_ok then
--   return
-- end
--
-- synthwave84.setup {
--   glow = {
--     error_msg = true,
--     type2 = true,
--     func = true,
--     keyword = true,
--     operator = false,
--     buffer_current_target = true,
--     buffer_visible_target = true,
--     buffer_inactive_target = true,
--   }
-- }

-- local boo_status_ok, boo = pcall(require, "boo-colorscheme")
-- boo.use({ theme = "forest_stream" })

local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

vim.g.tokyodark_enable_italic_comment = false
vim.g.tokyodark_enable_italic = false
vim.g.tokyodark_color_gamma = "1.0"
