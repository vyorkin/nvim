local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("plugins.lsp.mason")
require("plugins.lsp.handlers").setup()
require("plugins.lsp.null-ls")
require("plugins.lsp.inlayhints")
require("plugins.lsp.code-action-menu")
require("plugins.lsp.lightbulb")
require("plugins.lsp.symbols-outline")
