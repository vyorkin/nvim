local servers = {
  "cssls",
  "cssmodules_ls",
  "html",
  "tsserver",
  "eslint",
  "emmet_ls",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
  "rust_analyzer",
  "elixirls",
  "clangd",
  "cmake",
  -- "ocamllsp",
  "gopls",
  -- "hls",
  "purescriptls",
  "dhall_lsp_server",
  "arduino_language_server",
  "kotlin_language_server",
  "lua_ls",
  "pylsp",
  "pyright",
  -- "ruby_ls",
  -- "solc",
  "solidity",
  "taplo",
  "ltex",
  -- "awk_ls",
  -- "terraformls",
  "dockerls",
  "docker_compose_language_service",
}

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local util = require("lspconfig.util")

local opts = {}
local settings = {}

for _, server in pairs(servers) do
  server = vim.split(server, "@")[1]

  if server == "tsserver" then
    settings = require "plugins.lsp.settings.tsserver"
  end

  if server == "solidity" then
    opts.root_dir = util.root_pattern("foundry.toml", ".git")
    settings = require "plugins.lsp.settings.solidity"
  end

  if server == "pyright" then
    settings = require "plugins.lsp.settings.pyright"
  end

  if server == "rust_analyzer" then
    local rust_tools_opts = require("plugins.lsp.settings.rust-tools")
    local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
    if rust_tools_status_ok then
      rust_tools.setup(rust_tools_opts)
    end

    goto continue
  end

  opts = {
    on_attach = require("plugins.lsp.handlers").on_attach,
    capabilities = require("plugins.lsp.handlers").capabilities,
    settings = settings,
  }

  lspconfig[server].setup(opts)
  ::continue::
end
