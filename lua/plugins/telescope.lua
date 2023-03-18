local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

telescope.setup({
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },
    layout_strategy = "flex",
    layout_config = {
      vertical = { width = 0.5 },
    },
    mappings = {
      i = {
        ["<Down>"] = actions.cycle_history_next,
        ["<Up>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-t>"] = trouble.open_with_trouble,
      },
      n = { ["<C-t>"] = trouble.open_with_trouble },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
  },
})

require("telescope").load_extension("file_browser")
