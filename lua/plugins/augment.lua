-- enable/disable augment based on the cwd
-- dynamically set the workspace directory

return {
  {
    "augmentcode/augment.vim",
    enabled = function()
      local cwd = vim.uv.cwd()
      local file = cwd .. "/.augmentignore"
      local enabled = vim.uv.fs_stat(file) ~= nil
      return enabled
    end,
    config = function()
      local cwd = vim.uv.cwd()
      vim.g.augment_workspace_folders = { cwd }
    end,
  },
}
