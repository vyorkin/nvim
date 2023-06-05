-- Update this path
local extension_path = vim.env.HOME
  .. "/.vscode/extensions/vadimcn.vscode-lldb-1.9.2/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb"
local this_os = vim.loop.os_uname().sysname

-- The liblldb extension is .so for linux and .dylib for macOS
liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")

return {
  tools = {
    hover_actions = {
      auto_focus = true,
    },
    inlay_hints = {
      auto = false,
    },
  },
  server = {
    on_attach = function(client, bufnr)
      require("plugins.lsp.handlers").on_attach(client, bufnr)
      local rust_tools = require("rust-tools")
      client.server_capabilities.semanticTokensProvider = nil

      -- Hover actions
      vim.keymap.set(
        "n",
        "<leader>k",
        rust_tools.hover_actions.hover_actions,
        { buffer = bufnr }
      )
      -- Code action groups
      vim.keymap.set(
        "n",
        "<leader>j",
        rust_tools.code_action_group.code_action_group,
        { buffer = bufnr }
      )
    end,
    settings = {
      ["rust-analyzer"] = {
        lens = {
          enable = true,
        },
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
  dap = {
    adapter = require("rust-tools.dap").get_codelldb_adapter(
      codelldb_path,
      liblldb_path
    ),
  },
}
