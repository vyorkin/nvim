return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    local actions = require("telescope.actions")
    opts.defaults = opts.defaults or {}
    opts.defaults.mappings = opts.defaults.mappings or {}
    opts.defaults.mappings.i = {
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
    }
  end,

  keys = {
    { "<C-p>", ":Telescope projects<CR>", desc = "Find project" },
    { "<C-q>", ":Telescope find_files<CR>", desc = "Find Files" },
    { "<C-b>", ":Telescope buffers<CR>", desc = "Find buffer" },
  },
}
