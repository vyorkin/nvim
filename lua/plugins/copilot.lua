local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
  return
end

copilot.setup({
  suggestion = { enabled = true, auto_trigger = true },
  panel = { enabled = true, auto_refresh = true },
})

vim.api.nvim_set_keymap(
  "i",
  "<C-\\>",
  "<cmd>lua require('copilot.suggestion').accept()<CR>",
  { noremap = true, silent = true }
)
