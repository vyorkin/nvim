local status_ok, go = pcall(require, "go")
if not status_ok then
  return
end

go.setup({
  goimport = "gopls", -- if set to 'gopls' will use golsp format
  gofmt = "gopls", -- if set to gopls will use golsp format
  lsp_cfg = false, -- false: use your own lspconfig
  lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
  lsp_on_attach = true, -- use on_attach from go.nvim
})

-- Run gofmt + goimport on save
-- local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.go",
--   callback = function()
--     require("go.format").goimport()
--   end,
--   group = format_sync_grp,
-- })
