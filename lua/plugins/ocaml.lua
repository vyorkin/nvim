-- OCaml tooling.
--
-- Everything comes from the single opam switch (`~/.opam/default/bin`, linked
-- into ~/.local/bin so GUI-launched Neovim sees it): dune, ocamlformat, utop
-- and ocamlearlybird. The language server is `ocamllsp` (ocaml-lsp 1.27.0, the
-- release matching OCaml 5.5; 1.28 requires 5.6, which opam does not ship yet).
return {
  -- Merlin features the LSP client does not cover: typed holes (jump and
  -- construct), .ml <-> .mli switching, interface inference, search by type or
  -- polarity.
  {
    "tarides/ocaml.nvim",
    ft = { "ocaml", "ocaml_interface", "ocamllex", "menhir" },
    opts = {},
  },

  -- `dune fmt` readers: ocamlformat for sources, `dune format-dune-file` for
  -- dune/dune-project.
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ocaml = { "ocamlformat" },
        ocaml_interface = { "ocamlformat" },
        dune = { "format-dune-file" },
      },
    },
  },

  -- DAP via ocamlearlybird. The adapter serves DAP over TCP, so it is spawned
  -- here and nvim-dap connects to the port. Breakpoints need
  -- `(lang dune 3.7)` or newer and `(map_workspace_root false)` in dune-project.
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")

      dap.adapters.ocamlearlybird = function(callback, config)
        local port = config.port or 4711
        local handle, pid_or_err = vim.uv.spawn("ocamlearlybird", {
          args = { "serve", "--port", tostring(port) },
        }, function(code)
          if code ~= 0 then
            vim.notify("ocamlearlybird exited with code " .. code, vim.log.levels.WARN)
          end
        end)
        if not handle then
          vim.notify("cannot start ocamlearlybird: " .. tostring(pid_or_err), vim.log.levels.ERROR)
          return
        end
        vim.uv.unref(handle)

        -- Give the adapter a moment to bind the port before nvim-dap connects.
        vim.defer_fn(function()
          callback({ type = "server", host = "127.0.0.1", port = port })
        end, 300)
      end

      dap.configurations.ocaml = {
        {
          type = "ocamlearlybird",
          request = "launch",
          name = "Launch OCaml executable",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/_build/default/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
    end,
  },
}
