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

local mappings = {
  l = {
    name = "LSP",
    a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
    f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    h = { "<cmd>lua require('lsp-inlayhints').toggle()<cr>", "Toggle Hints" },
    m = { "<cmd>Mason<cr>", "Mason" },
    j = {
      "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>Lspsaga rename<cr>", "Rename" },
    R = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    u = { "<cmd>LuaSnipUnlinkCurrent<cr>", "Unlink Snippet" },
  },
  c = {
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
  d = {
    name = "Debug",
    b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Breakpoint" },
    c = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
    i = { "<cmd>lua require('dap').step_into()<cr>", "Into" },
    o = { "<cmd>lua require('dap').step_over()<cr>", "Over" },
    O = { "<cmd>lua require('dap').step_out()<cr>", "Out" },
    r = { "<cmd>lua require('dap').repl.toggle()<cr>", "Repl" },
    l = { "<cmd>lua require('dap').run_last()<cr>", "Last" },
    u = { "<cmd>lua require('dapui').toggle()<cr>", "UI" },
    x = { "<cmd>lua require('dap').terminate()<cr>", "Exit" },
  },
}

which_key.register(mappings, opts)
