-- Omarchy theme loader.
--
-- On Omarchy, `omarchy theme set` writes the active theme's spec to the state
-- dir; we load it and hand it back to lazy.nvim, so the Omarchy colorscheme
-- overrides the one picked by colorscheme.lua (this module is imported after
-- colorscheme.lua alphabetically, hence wins the spec merge).
--
-- Elsewhere (macOS, other machines) no spec exists and we return an empty spec,
-- leaving colorscheme.lua in full control.
local theme_file = require("config.omarchy").theme_file()
if not theme_file then
  return {}
end

local ok, spec = pcall(dofile, theme_file)
if not ok or type(spec) ~= "table" then
  return {}
end

return spec
