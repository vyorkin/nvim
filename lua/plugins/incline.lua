return {
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local devicons = require("nvim-web-devicons")

      local function set_incline_highlights()
        vim.cmd([[
        highlight InclineNormal guibg=#ff007c guifg=#ffffff
        highlight InclineNormalNC guibg=#3d59a1 guifg=#ffffff
      ]])
      end

      -- Reset the highlights whenever the color scheme changes
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = set_incline_highlights,
      })

      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = "#ff007c", guifg = "#ffffff" },
            InclineNormalNC = { guifg = "#ffffff", guibg = "#3d59a1" },
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
