return {
  {
    "kosayoda/nvim-lightbulb",
    event = "LspAttach",
    config = function()
      require("nvim-lightbulb").setup({
        autocmd = { enabled = true, updatetime = 50 },
        sign = {
          enabled = false,
        },
        virtual_text = {
          enabled = true,
          -- ASCII markers, same style as the lean.nvim goal markers (see lean.lua)
          text = "*",
          lens_text = "+",
          -- Highlight group to highlight the sign column text.
          hl = "LightBulbSign",
        },
      })
    end,
  },
}
