local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(
    sign.name,
    { texthl = sign.name, text = sign.text, numhl = sign.name }
  )
end

local config = {
  -- Disable virtual text
  virtual_text = false,

  -- virtual_text = {
  --   prefix = "●",
  -- },

  signs = {
    -- Show signs
    active = signs,
  },
  update_in_insert = true,
  underline = false,
  severity_sort = true,
  float = {
    source = "always",
    focusable = true,
    style = "minimal",
    border = "rounded",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config)
