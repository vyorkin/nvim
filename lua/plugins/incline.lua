return {
  {
    "b0o/incline.nvim",
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
        highlight = {
          groups = {
            InclineNormal = { group = "WinBar" },
            InclineNormalNC = { group = "WinBarNC" },
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
