return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- Optional, but recommended
  },
  -- Neo-tree will lazily load itself
  lazy = false,
  ---@module 'neo-tree'
  ---@type neotree.Config
  opts = {
    window = {
      width = 30,
    },
    -- I don't like italics
    enable_git_status = false,
  },
}
