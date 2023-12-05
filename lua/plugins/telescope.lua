local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require("telescope.actions")
local fb_actions = require("telescope._extensions.file_browser.actions")
local trouble = require("trouble.providers.telescope")

telescope.setup({
  defaults = {
    -- prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },
    layout_strategy = "flex",
    layout_config = {
      vertical = { width = 0.5 },
    },

    borderchars = {
      prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
      results = { " " },
      preview = { " " },
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
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- Override the generic sorter
      override_file_sorter = true, -- Override the file sorter
      -- Or "ignore_case" or "respect_case",
      -- the default case_mode is "smart_case"
      case_mode = "smart_case",
    },
    file_browser = {
      initial_mode = "normal",
      theme = "ivy",
      -- Disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        n = {
          h = fb_actions.goto_parent_dir,
          j = actions.move_selection_worse,
          k = actions.move_selection_better,
          l = actions.select_default, -- action for going into directories and opening files
        },
      },
    },
  },
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")
