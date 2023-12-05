local M = {}

M.setup = function()
  vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })

  vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
    })

  -- Show diagnostics floating window on CursorHold
  -- Requires low vim.o.updateTime value (see options.lua)
  -- vim.cmd(
  --   [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
  -- )
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap

  keymap(bufnr, "n", "gd", ":Telescope lsp_definitions<CR>", opts)
  keymap(bufnr, "n", "gi", ":Telescope lsp_implementations<CR>", opts)
  keymap(bufnr, "n", "gr", ":Telescope lsp_references<CR>", opts)
  keymap(bufnr, "n", "<C-s>", ":Telescope lsp_document_symbols<CR>", opts)

  keymap(bufnr, "n", "<leader>lR", ":lua vim.lsp.buf.rename()<CR>", opts)
  keymap(
    bufnr,
    "n",
    "<leader>ls",
    ":lua vim.lsp.buf.signature_help()<CR>",
    opts
  )

  -- Errors/Diagnositics
  keymap(bufnr, "n", "<leader>ted", ":lua vim.diagnostic.disable()<CR>", opts)
  keymap(bufnr, "n", "<leader>tee", ":lua vim.diagnostic.enable()<CR>", opts)

  -- Hover Doc
  keymap(bufnr, "n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)

  -- Outline
  keymap(bufnr, "n", "<leader>o", ":SymbolsOutline<CR>", opts)
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

local cmp_default_capabilities = require("cmp_nvim_lsp").default_capabilities()
M.capabilities = cmp_default_capabilities

return M
