return {
  {
    "saghen/blink.cmp",
    opts = {
      -- Exclude keywords/constants from autocomplete
      sources = {
        min_keyword_length = function()
          return vim.bo.filetype == "markdown" and 3 or 2
        end,
        providers = {
          lsp = {
            name = "LSP",
            module = "blink.cmp.sources.lsp",
            transform_items = function(_, items)
              return vim.tbl_filter(function(item)
                return item.kind ~= require("blink.cmp.types").CompletionItemKind.Keyword
              end, items)
            end,
          },
          -- Pick up lean.nvim's bundled VSCode-format snippets (calc/example/
          -- namespace/section scaffolding) in addition to the default folder.
          snippets = {
            opts = {
              search_paths = {
                vim.fn.stdpath("config") .. "/snippets",
                vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", "lean.nvim", "snippets"),
              },
            },
          },
        },
      },

      keymap = {
        preset = "enter",
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
      },
    },
  },
}
