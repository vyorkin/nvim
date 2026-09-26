-- Omarchy integration helpers.
--
-- Omarchy (https://omarchy.org) generates a Neovim theme spec at
--   ~/.local/state/omarchy/current/theme/neovim.lua  (Omarchy 4)
--   ~/.config/omarchy/current/theme/neovim.lua       (Omarchy 3.x)
-- and rewrites it on `omarchy theme set`. The plugin files that follow opt in
-- only when that spec exists, so on machines without Omarchy (macOS included)
-- this config behaves exactly as if the integration were not there.

local M = {}

--- Path of the active Omarchy theme spec, or nil when Omarchy isn't present.
function M.theme_file()
  local candidates = {
    vim.env.HOME .. "/.local/state/omarchy/current/theme/neovim.lua",
    vim.env.HOME .. "/.config/omarchy/current/theme/neovim.lua",
  }
  for _, path in ipairs(candidates) do
    if vim.uv.fs_stat(path) then
      return path
    end
  end
  return nil
end

--- Whether Omarchy is present and has generated a theme spec.
function M.active()
  return M.theme_file() ~= nil
end

return M
