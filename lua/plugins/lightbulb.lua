return {
  "kosayoda/nvim-lightbulb",
  enabled = false,
  config = function()
    require("nvim-lightbulb").setup({
      autocmd = { enabled = true, updatetime = 50 },
      sign = {
        enabled = false,
      },
      virtual_text = {
        enabled = true,
        -- Text to show in the sign column.
        -- Must be between 1-2 characters.
        text = "🛠", -- 🔥, ⭐, 🩼, 💊, 🔧, 🛠, ⚔️, 🪄, 🍉, 🍓, 🤙, ◼️, 🔹, 🔻, ➕
        lens_text = "⭐",
        -- Highlight group to highlight the sign column text.
        hl = "LightBulbSign",
      },
    })
  end,
}
