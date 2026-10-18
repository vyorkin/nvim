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

--- Directory holding the active theme's generated files.
function M.theme_dir()
  local file = M.theme_file()
  return file and vim.fn.fnamemodify(file, ":h") or nil
end

--- The active theme's colors.toml, the file every Omarchy consumer reads.
function M.colors_file()
  local dir = M.theme_dir()
  if not dir then
    return nil
  end
  local path = dir .. "/colors.toml"
  return vim.uv.fs_stat(path) and path or nil
end

--- "light" or "dark" as the active theme declares it in colors.toml, or nil
--- when the theme doesn't say. Wallpaper-generated themes omit `mode`, so fall
--- back to the perceived brightness of their background: a theme whose
--- background is nearly white is meant to be read as light.
---
--- `file` defaults to the active theme's colors.toml and exists so the parser
--- can be exercised against any theme without switching the desktop theme.
---@param file? string
function M.mode(file)
  file = file or M.colors_file()
  if not file then
    return nil
  end

  local ok, lines = pcall(vim.fn.readfile, file)
  if not ok then
    return nil
  end

  local background
  for _, line in ipairs(lines) do
    local declared = line:match([[^%s*mode%s*=%s*"([^"]*)"]])
    if declared == "light" or declared == "dark" then
      return declared
    end
    background = background or line:match([[^%s*background%s*=%s*"(#[0-9a-fA-F]+)"]])
  end
  if not background then
    return nil
  end

  local hex = background:sub(2)
  local r, g, b = tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
  return (0.299 * r + 0.587 * g + 0.114 * b) > 127 and "light" or "dark"
end

return M
