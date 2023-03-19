local servers = {
  "cssls",
  "html",
  "tsserver",
  "eslint",
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
  "hls",
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
  "awk_ls",
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

  if server == "solidity" then
    opts.root_dir = util.root_pattern("foundry.toml", ".git")
    settings = {
      solidity = {
        includePath = "lib/",
        remapping = {
          ["forge-std/"] = "lib/forge-std/src/",
          ["openzeppelin"] = "lib/openzeppelin-contracts/contracts/",
          ["ds-test"] = "lib/ds-test/src/",
          ["uniswap-v2-core/"] = "/=lib/v2-core/contracts/",
          ["uniswap-v2-periphery/"] = "lib/v2-periphery/contracts/",
        },
      },
    }
  end

  opts = {
    on_attach = require("plugins.lsp.handlers").on_attach,
    capabilities = require("plugins.lsp.handlers").capabilities,
    settings = settings,
  }

  local require_ok, conf_opts =
    pcall(require, "plugins.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end
