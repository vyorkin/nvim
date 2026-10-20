-------------------------------------------------------------------------------
-- Aliases
-------------------------------------------------------------------------------

local g = vim.g

-------------------------------------------------------------------------------
-- Tweaks
-------------------------------------------------------------------------------

g.neovide_floating_blur_amount_x = 4.0
g.neovide_floating_blur_amount_y = 4.0

g.neovide_floating_shadow = true
g.neovide_floating_z_height = 10
g.neovide_light_angle_degrees = 45
g.neovide_light_radius = 5

g.neovide_scroll_animation_length = 0.2
-- The cursor jumps straight to its spot: no flight animation, no trail. Both
-- are per-frame animation work on the hot path and read as input lag.
g.neovide_cursor_animation_length = 0
g.neovide_cursor_trail_size = 0
g.neovide_cursor_animate_in_insert_mode = false

g.neovide_theme = "auto"
g.neovide_refresh_rate = 60
-- g.neovide_fullscreen = true

g.neovide_padding_top = 2
g.neovide_padding_bottom = 2
g.neovide_padding_right = 2
g.neovide_padding_left = 2

g.neovide_hide_mouse_when_typing = false
g.neovide_remember_window_size = true
g.neovide_input_macos_option_key_is_meta = true

g.neovide_cursor_animate_command_line = false

-- Cursor particles ("wireframe") are extra draws on every cursor move, so
-- they stay off along with the rest of the cursor animation.
g.neovide_cursor_vfx_mode = ""

g.neovide_window_blurred = true
g.neovide_show_border = true

g.neovide_opacity = 1.0

g.neovide_scale_factor = 1.0

local change_scale_factor = function(delta)
  g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.keymap.set("n", "<C-=>", function()
  change_scale_factor(1.1)
end)
vim.keymap.set("n", "<C-->", function()
  change_scale_factor(1 / 1.1)
end)
