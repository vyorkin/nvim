return {
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
      },
    },

    keymap = {
      preset = "enter",
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
    },
  },
}
