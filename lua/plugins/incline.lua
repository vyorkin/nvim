-- Disabled on 2026-10-20: while scrolling, incline re-renders its floating
-- window on CursorMoved, CursorMovedI, CursorHold and WinScrolled, which is an
-- extra paint per cursor move. Measured Neovim-side scroll cost is ~0.05 ms per
-- frame, so this was the one per-frame plugin cost left worth removing; the
-- filename pill is not worth it with a hidden statusline (laststatus = 0).
--
-- Rollback: set `enabled = true` (or delete that line) and un-comment the
-- `require("incline").disable()/enable()` calls in lua/plugins/zen.lua, which
-- are wrapped in pcall while this plugin is off.
--
-- Original config kept below for the rollback.
return {
  {
    "b0o/incline.nvim",
    enabled = false,
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local devicons = require("nvim-web-devicons")

      require("incline").setup({
        -- Link to WinBar/WinBarNC instead of hardcoding colors, so the
        -- filename pill follows whichever colorscheme is active (see
        -- colorscheme.lua's cold/inspired-github system-appearance switch).
        -- incline.nvim re-applies `highlight.groups` on every `ColorScheme`
        -- event on its own, so no extra autocmd is needed here.
        --
        -- The plain-string form is the one this version's schema accepts:
        -- `{ group = "WinBar" }` is rejected with "invalid value for field
        -- highlight.groups", even though the README documents it.
        highlight = {
          groups = {
            InclineNormal = "WinBar",
            InclineNormalNC = "WinBarNC",
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if filename == "" then
            filename = "[No Name]"
          end

          local modified = vim.bo[props.buf].modified
          if modified then
            filename = "[*] " .. filename
          end

          local icon, color = devicons.get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },
}
