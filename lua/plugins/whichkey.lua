local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

-- TODO: https://github.com/ChristianChiarulli/nvim/blob/1631262e8df1de2ad0ecfd5f7dffd9c4476d7933/lua/user/whichkey.lua

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

-- require('crates').focus_popup()
-- require('crates').hide_popup()

local mappings = {
  L = {
    name = "Cargo",

    t = { "<cmd>lua require('crates').toggle()<CR>", "Toggle Hints" },

    u = { "<cmd>lua require('crates').update_crate()<CR>", "Update" },
    U = { "<cmd>lua require('crates').upgrade_crate()<CR>", "Upgrade" },

    a = { "<cmd>lua require('crates').update_all_crates()<CR>", "Update All" },
    A = { "<cmd>lua require('crates').upgrade_all_crates()<CR>", "Upgrade All" },

    h = { "<cmd>lua require('crates').open_homepage()<CR>", "Open Home" },
    r = { "<cmd>lua require('crates').open_repository()<CR>", "Open Repo" },
    d = { "<cmd>lua require('crates').open_documentation()<CR>", "Open Doc" },
    c = { "<cmd>lua require('crates').open_crates_io()<CR>", "Open Crates.io" },
    i = { "<cmd>lua require('crates').show_popup()<CR>", "Info" },
    v = { "<cmd>lua require('crates').show_versions_popup()<CR>", "Versions" },
    f = { "<cmd>lua require('crates').show_features_popup()<CR>", "Features" },
    D = {
      "<cmd>lua require('crates').show_dependencies_popup()<CR>",
      "Dependencies",
    },
  },
}

which_key.register(mappings, opts)
