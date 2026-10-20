return {
  {
    "kosayoda/nvim-lightbulb",
    event = "LspAttach",
    config = function()
      require("nvim-lightbulb").setup({
        -- 50 ms meant a code-action request to LSP almost every time the
        -- cursor parked, which is most of the time while scrolling.
        autocmd = { enabled = true, updatetime = 1000 },
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
