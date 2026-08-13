-- Replaces ahmedkhalf/project.nvim, which has had no commits since
-- August 2024 and 90+ open issues. This is also what LazyVim's own
-- util.project extra pulls in, so that extra is disabled in lazyvim.json
-- in favor of this plugin. coffebar/neovim-project is actively maintained
-- and integrates directly with the snacks.nvim picker already in use here.
return {
  {
    "coffebar/neovim-project",
    opts = {
      projects = {
        "~/projects/*/*",
      },
      picker = {
        type = "snacks",
      },
    },
    init = function()
      -- enable saving the state of plugins in the session
      vim.opt.sessionoptions:append("globals")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/snacks.nvim",
      "Shatur/neovim-session-manager",
    },
    lazy = false,
    priority = 100,
    keys = {
      { "<leader>fp", "<cmd>NeovimProjectDiscover<cr>", desc = "Projects" },
    },
  },
}
