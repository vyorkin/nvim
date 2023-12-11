local status_ok, inlayhints = pcall(require, "lsp-inlayhints")
if not status_ok then
  return
end

vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    inlayhints.on_attach(client, bufnr)
  end,
})

inlayhints.setup({
  inlay_hints = {
    parameter_hints = {
      show = true,
      prefix = "<- ",
      separator = ", ",
    },
    type_hints = {
      show = true,
      prefix = "",
      separator = ", ",
      remove_colon_end = false,
      remove_colon_start = false,
    },
    -- separator between types and parameter hints. Note that type hints are
    -- shown before parameter
    labels_separator = "  ",
    -- whether to align to the length of the longest line in the file
    max_len_align = false,
    -- padding from the left if max_len_align is true
    max_len_align_padding = 1,
    -- whether to align to the extreme right or not
    right_align = false,
    -- padding from the right if right_align is true
    right_align_padding = 7,
    -- highlight group
    highlight = "LspInlayHint",
  },
  enabled_at_startup = true,
  debug_mode = false,
})

-- vim.cmd([[hi LspInlayHint guibg=#131313 guifg=#202020]])
