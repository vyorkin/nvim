return {
  "mmsaki/forgefmt.nvim",
  config = function()
    require("forgefmt").setup({
      auto_format = true, -- enable autoformat on save
      -- Support for [`shafu`](https://github.com/shafu0x/shafu-formatter) Requires `shafu` to be available in your `$PATH`.
      -- Shafu formatter support is still in early development and may produce unstable results.
      -- Keep this false unless you want to try shafu
      use_shafu = false,
    })
  end,
}
