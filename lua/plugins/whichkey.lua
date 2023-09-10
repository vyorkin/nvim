local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

-- TODO: https://github.com/ChristianChiarulli/nvim/blob/1631262e8df1de2ad0ecfd5f7dffd9c4476d7933/lua/user/whichkey.lua

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- Use `silent` when creating keymaps
  noremap = true, -- Use `noremap` when creating keymaps
  nowait = true, -- Use `nowait` when creating keymaps
}

local mappings = {
  e = {
    name = "Error",

    j = {
      "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>",
      "Prev Diagnostic",
    },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "Quickfix" },
  },
  g = {
    name = "LSP",

    d = { "<cmd>Telescope lsp_definitions<CR>", "Go to the definition" },
    i = { "<cmd>Telescope lsp_implementations<CR>", "Go to the implementation" },
    r = { "<cmd>Telescope lsp_references<CR>", "List references" },
  },
  l = {
    name = "LSP",

    -- Buffer
    f = { "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", "Format" },
    R = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename buffer" },

    I = { "<cmd>LspInfo<CR>", "Info" },
    h = { "<cmd>lua require('lsp-inlayhints').toggle()<CR>", "Toggle Hints" },
    m = { "<cmd>Mason<CR>", "Mason" },

    -- Errors/Diagnositics
    -- l = { "<cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
    s = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
      "Workspace Symbols",
    },
    u = { "<cmd>LuaSnipUnlinkCurrent<CR>", "Unlink Snippet" },
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
    b = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Breakpoint" },
    c = { "<cmd>lua require('dap').continue()<CR>", "Continue" },
    i = { "<cmd>lua require('dap').step_into()<CR>", "Into" },
    o = { "<cmd>lua require('dap').step_over()<CR>", "Over" },
    O = { "<cmd>lua require('dap').step_out()<CR>", "Out" },
    r = { "<cmd>lua require('dap').repl.toggle()<CR>", "Repl" },
    l = { "<cmd>lua require('dap').run_last()<CR>", "Last" },
    u = { "<cmd>lua require('dapui').toggle()<CR>", "UI" },
    x = { "<cmd>lua require('dap').terminate()<CR>", "Exit" },
  },
}

which_key.register(mappings, opts)
