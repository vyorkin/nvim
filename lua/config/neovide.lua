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
g.neovide_cursor_animation_length = 0.1

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

-- g.neovide_cursor_vfx_mode = ""
-- g.neovide_cursor_vfx_mode = "pixiedust"
g.neovide_cursor_vfx_mode = "wireframe"
g.neovide_cursor_vfx_opacity = 120.0
g.neovide_cursor_vfx_particle_lifetime = 5.0
g.neovide_cursor_vfx_particle_density = 120.0
g.neovide_cursor_vfx_particle_speed = 80.0
g.neovide_cursor_vfx_particle_phase = 1.5
g.neovide_cursor_vfx_particle_curl = 1.0

g.neovide_window_blurred = true
g.neovide_show_border = true

g.neovide_transparency = 1.0

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
