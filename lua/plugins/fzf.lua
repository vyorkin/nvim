return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")
    vim.keymap.set("n", "<C-q>", fzf.files)
  end,
}
