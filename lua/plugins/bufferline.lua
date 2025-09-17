return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    enabled = false,
    opts = function(_, opts)
      if (vim.g.colors_name or ""):find("catppuccin") then
        opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
      end
      opts.show_buffer_close_icons = false
      opts.show_close_icon = false
    end,
  },
}
