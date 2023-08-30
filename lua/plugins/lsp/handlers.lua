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
      { texthl = sign.name, text = sign.text, numhl = sign.name }
    )
  end

  local config = {
    -- Disable virtual text
    virtual_text = {
      prefix = "●",
    },
    signs = {
      -- Show signs
      active = signs,
    },
    update_in_insert = true,
    underline = false,
    severity_sort = true,
    float = {
      source = "always",
      focusable = true,
      style = "minimal",
      border = "rounded",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)
  -- vim.diagnostic.disable()

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

  keymap(bufnr, "n", "gd", ":Telescope lsp_definitions<CR>", opts)
  keymap(bufnr, "n", "gI", ":Telescope lsp_implementations<CR>", opts)
  keymap(bufnr, "n", "gf", ":Telescope lsp_references<CR>", opts)

  keymap(bufnr, "n", "<leader>lr", ":lua vim.lsp.buf.rename()<CR>", opts)
  keymap(
    bufnr,
    "n",
    "<leader>ls",
    ":lua vim.lsp.buf.signature_help()<CR>",
    opts
  )

  -- Errors/Diagnositics
  keymap(bufnr, "n", "<leader>e", ":lua vim.diagnostic.open_float()<CR>", opts)
  keymap(bufnr, "n", "<leader>te", ":lua vim.diagnostic.disable()<CR>", opts)
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)

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

  local lsp_inlayhints_status_ok, lsp_inlayhints =
    pcall(require, "lsp-inlayhints")
  if lsp_inlayhints_status_ok then
    lsp_inlayhints.on_attach(client, bufnr)
  end

  local illuminate_status_ok, illuminate = pcall(require, "illuminate")
  if illuminate_status_ok then
    illuminate.on_attach(client)
  end
end

return M
