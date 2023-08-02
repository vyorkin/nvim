local status_ok, lsp_signature = pcall(require, "lsp_signature")
if not status_ok then
  return
end

local opts = {
  bind = true,
  handler_opts = {
    border = "rounded",
  },
  noice = true, -- set to true if you using noice to render markdown
  doc_lines = 0,
  transparency = 80,
  max_width = 120,
}

lsp_signature.setup(opts)
