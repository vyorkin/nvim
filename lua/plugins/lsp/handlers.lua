local M = {}

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(
      sign.name,
      { texthl = sign.name, text = sign.text, numhl = "" }
    )
  end

  local config = {
    -- Disable virtual text
    virtual_text = false,
    signs = {
      -- Show signs
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })

  vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
    })
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap

  keymap(bufnr, "n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
  -- keymap(bufnr, "n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
  keymap(bufnr, "n", "gI", ":lua vim.lsp.buf.implementation()<CR>", opts)
  keymap(bufnr, "n", "gf", ":lua vim.lsp.buf.references()<CR>", opts)
  keymap(bufnr, "n", "gl", ":lua vim.diagnostic.open_float()<CR>", opts)
  keymap(bufnr, "n", "<leader>li", ":LspInfo<CR>", opts)
  keymap(bufnr, "n", "<leader>lI", ":Mason<CR>", opts)
  keymap(bufnr, "n", "<leader>la", ":lua vim.lsp.buf.code_action()<CR>", opts)
  keymap(
    bufnr,
    "n",
    "<leader>lj",
    ":lua vim.diagnostic.goto_next({buffer=0})<CR>",
    opts
  )
  keymap(
    bufnr,
    "n",
    "<leader>lk",
    ":lua vim.diagnostic.goto_prev({buffer=0})<CR>",
    opts
  )
  keymap(bufnr, "n", "<leader>lr", ":lua vim.lsp.buf.rename()<CR>", opts)
  keymap(
    bufnr,
    "n",
    "<leader>ls",
    ":lua vim.lsp.buf.signature_help()<CR>",
    opts
  )
  keymap(bufnr, "n", "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>", opts)

  -- LSP finder find the symbol definition implement reference
  -- if there is no implement it will hide
  -- when you use action in finder like open vsplit then you can
  -- use <C-t> to jump back
  keymap(bufnr, "n", "gh", ":Lspsaga lsp_finder<CR>", opts)

  -- Code action
  keymap(bufnr, "n", "<leader>ca", ":Lspsaga code_action<CR>", opts)

  -- Rename
  keymap(bufnr, "n", "gr", ":Lspsaga rename<CR>", opts)

  -- Peek Definition
  -- you can edit the definition file in this floating window
  -- also support open/vsplit/etc operation check definition_action_keys
  -- support tagstack C-t jump back
  keymap(bufnr, "n", "gp", ":Lspsaga peek_definition<CR>", opts)

  -- Outline
  keymap(bufnr, "n", "<leader>o", ":Lspsaga outline<CR>", opts)

  -- Hover Doc
  keymap(bufnr, "n", "K", ":Lspsaga hover_doc<CR>", opts)
end

M.on_attach = function(client, bufnr)
  local sc = client.server_capabilities

  if client.name == "pyright" then
    sc.hover = false
  end

  if client.name == "pylsp" then
    sc.rename = false
    sc.signature_help = false
  end

  if client.name == "tsserver" or client.name == "sumneko_lua" then
    client.server_capabilities.documentFormattingProvider = false
  end

  lsp_keymaps(bufnr)

  local illuminate_status_ok, illuminate = pcall(require, "illuminate")
  if illuminate_status_ok then
    illuminate.on_attach(client)
  end

  -- local signature_status_ok, signature = pcall(require, "lsp_signature")
  -- if signature_status_ok then
  --   signature.on_attach(client)
  -- end
end

return M
