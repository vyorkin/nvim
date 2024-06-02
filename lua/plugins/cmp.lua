return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")

    opts.mapping = opts.mapping or {}
    opts.mapping = cmp.mapping.preset.insert({
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),

      ["<CR>"] = cmp.mapping.confirm({ select = true }),
    })

    return opts
  end,
}
