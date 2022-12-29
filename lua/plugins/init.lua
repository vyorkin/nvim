-- Bootstrap packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost */lua/plugins/init.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup({function(use)
  -- Have packer manage itself
  use "wbthomason/packer.nvim"

  -- Speed up loading Lua modules in Neovim to improve startup time
  use "lewis6991/impatient.nvim"

  -- Configurations for LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim"

  -- LSP signature hint as you type
  use "ray-x/lsp_signature.nvim"

  -- Automatically highlights other uses of the
  -- word under the cursor using either LSP, Treesitter, or regex matching
  use "RRethy/vim-illuminate"

  -- Treesitter configurations and abstraction layer
  use "nvim-treesitter/nvim-treesitter"

  -- DAP
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  use "ravenxrz/DAPInstall.nvim"

  -- Snippets
  use "L3MON4D3/LuaSnip"

  -- A bunch of snippets to use
  use "rafamadriz/friendly-snippets"

  -- A completion engine plugin for neovim written in Lua
  use "hrsh7th/nvim-cmp"
  -- Buffer completions
  use "hrsh7th/cmp-buffer"
  -- Path completions
  use "hrsh7th/cmp-path"
  -- Command line completions
  use "hrsh7th/cmp-cmdline"
  -- LuaSnip completion source
  use "saadparwaiz1/cmp_luasnip"

  --
  use "hrsh7th/cmp-nvim-lsp"

  --
  use "hrsh7th/cmp-nvim-lua"

  -- Smart and powerful comment plugin for neovim.
  -- Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
  use "numToStr/Comment.nvim"

  -- A treesitter plugin for setting the commentstring based on the cursor location in a file
  use "JoosepAlviste/nvim-ts-context-commentstring"

  use "nvim-tree/nvim-web-devicons"

  -- A tabline plugin with re-orderable, auto-sizing, clickable tabs,
  -- icons, nice highlighting, sort-by commands and a magic jump-to-buffer mode
  -- use { "romgrk/barbar.nvim", wants = "nvim-web-devicons" }

  -- A snazzy bufferline (with tabpage integration)
  use "akinsho/bufferline.nvim"

  -- Add/change/delete surrounding delimiter pairs with ease
  use "kylechui/nvim-surround"

  -- Find, Filter, Preview, Pick
  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.0",
    requires = { { "nvim-lua/plenary.nvim" } }
  }

  -- Adds indentation guides to all lines (including empty lines)
  use "lukas-reineke/indent-blankline.nvim"

  -- A blazing fast and easy to configure
  -- neovim statusline plugin written in pure Lua
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }

  -- A work-in-progress Magit clone for Neovim that is geared toward the Vim philosophy
  use { "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" }

  -- Super fast git decorations
  use "lewis6991/gitsigns.nvim"

  -- Distraction-free coding
  use "folke/zen-mode.nvim"

  -- A pretty diagnostics, references, telescope results,
  -- quickfix and location list to help you solve all the trouble your code is causing
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }

  -- The superior project management solution
  use "ahmedkhalf/project.nvim"

  -- A file explorer tree for neovim written in Lua
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      -- Optional, for file icons
      "nvim-tree/nvim-web-devicons",
    },
    -- Optional, updated every week (see issue #1193)
    tag = "nightly"
  }

  -- A super powerful autopair plugin for Neovim that supports multiple characters
  use "windwp/nvim-autopairs"

  -- Themes
  use "EdenEast/nightfox.nvim"
  use "rebelot/kanagawa.nvim"
  use "folke/tokyonight.nvim"
  use "lunarVim/Colorschemes"
  use "lunarvim/synthwave84.nvim"
  use "lunarvim/Onedarker.nvim"
  use "lunarvim/darkplus.nvim"
  use "projekt0n/github-nvim-theme"
  use "sainnhe/gruvbox-material"
  use "sainnhe/sonokai"
  use "sainnhe/everforest"
  use "sainnhe/edge"
  use "marko-cerovac/material.nvim"
  use "catppuccin/nvim"
  use "dracula/vim"
  use "shaunsingh/nord.nvim"
  use "ellisonleao/gruvbox.nvim"
  use "nyoom-engineering/nyoom.nvim"
  use "nyoom-engineering/oxocarbon.nvim"
  use "NTBBloodbath/doom-one.nvim"
  use "phha/zenburn.nvim"
  use "JoosepAlviste/palenightfall.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end,
config = {
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end
  }
}})
