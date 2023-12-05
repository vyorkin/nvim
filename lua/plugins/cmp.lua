local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require("luasnip.loaders.from_vscode").lazy_load()

local copilot_cmp_status_ok, copilot_cmp = pcall(require, "copilot_cmp")
if copilot_cmp_status_ok then
  copilot_cmp.setup()
end

local check_backspace = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local kind_icons = {
  Text = " [txt]",
  Method = " [meth]",
  Function = " [fn]",
  Constructor = " [ctor]",
  Field = " [field]",
  Variable = " [var]",
  Class = " [class]",
  Interface = " [iface]",
  Module = " [module]",
  Property = " [prop]",
  Unit = " [unit]",
  Value = " [val]",
  Enum = " [enum]",
  Keyword = " [keyword]",
  Snippet = " [snippet]",
  Color = " [color]",
  File = " [file]",
  Reference = " [ref]",
  Folder = " [dir]",
  EnumMember = " [enum val]",
  Constant = " [const]",
  Struct = " [struct]",
  Event = " [event]",
  Operator = " [op]",
  TypeParameter = " [type param]",
  Copilot = " [copilot]",
}

cmp.setup({
  enabled = function()
    local buftype = vim.api.nvim_buf_get_option(0, "buftype")
    if buftype == "prompt" then
      return false
    end

    -- disable completion in comments
    local context = require("cmp.config.context")
    -- keep command mode completion enabled when cursor is in a comment
    if vim.api.nvim_get_mode().mode == "c" then
      return true
    else
      return not context.in_treesitter_capture("comment")
        and not context.in_syntax_group("Comment")
    end
  end,

  snippet = {
    expand = function(args)
      -- For `luasnip`
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),

    ["<M-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-8), { "i", "c" }),
    ["<M-d>"] = cmp.mapping(cmp.mapping.scroll_docs(8), { "i", "c" }),
    ["<M-j>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<M-k>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),

    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  }),

  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.kind = kind_icons[vim_item.kind]
      return vim_item
    end,
  },

  sources = {
    { name = "copilot", priority = 90 },
    { name = "nvim_lsp", priority = 80 },
    { name = "luasnip", priority = 70 },
    { name = "nvim_lua", priority = 60 },
    { name = "buffer", priority = 50 },
    { name = "path", priority = 40 },
    { name = "crates", priority = 30 },
    {
      name = "latex_symbols",
      option = {
        strategy = 1, -- Julia
      },
      priority = 20,
    },
  },

  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  experimental = {
    ghost_text = false,
  },
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = "buffer" },
  }),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})
