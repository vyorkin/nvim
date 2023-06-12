-- Bootstrap packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data")
    .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    })
    vim.cmd([[packadd packer.nvim]])
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

local packer = require("packer")
packer.init({ max_jobs = 50 })

return packer.startup({
  function(use)
    -- Have packer manage itself
    use("wbthomason/packer.nvim")

    -- Speed up loading Lua modules in Neovim to improve startup time
    use("lewis6991/impatient.nvim")

    -- Configurations for LSP
    use("neovim/nvim-lspconfig")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("jose-elias-alvarez/null-ls.nvim")

    -- Partial implementation of LSP inlay hint
    use("lvimuser/lsp-inlayhints.nvim")

    -- A GUI library for Neovim plugin developers
    -- For example, it is needed for floating window support
    use("ray-x/guihua.lua")

    -- LSP signature hint as you type
    use("ray-x/lsp_signature.nvim")

    -- A light-weight lsp plugin based on neovim's built-in lsp with a highly performant UI
    use({
      "glepnir/lspsaga.nvim",
      branch = "main",
      requires = {
        { "nvim-tree/nvim-web-devicons" },
        -- Make sure you install markdown and markdown_inline parser
        { "nvim-treesitter/nvim-treesitter" },
      },
    })

    -- Automatically highlights other uses of the
    -- word under the cursor using either LSP, Treesitter, or regex matching
    use("RRethy/vim-illuminate")

    -- Highlight arguments' definitions and usages, using Treesitter
    use({
      "m-demare/hlargs.nvim",
      requires = { "nvim-treesitter/nvim-treesitter" },
    })

    use({ "simrat39/rust-tools.nvim", branch = "master" })

    -- Helps managing crates.io dependencies
    use({
      "saecki/crates.nvim",
      tag = "v0.3.0",
      requires = { "nvim-lua/plenary.nvim" },
    })

    -- Treesitter configurations and abstraction layer
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    -- DAP
    use("mfussenegger/nvim-dap")
    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
    use("mfussenegger/nvim-dap-python")

    -- Snippets
    use({ "L3MON4D3/LuaSnip", after = "friendly-snippets" })

    -- A bunch of snippets to use
    use("rafamadriz/friendly-snippets")

    -- For interacting with Github Copilot
    use("zbirenbaum/copilot.lua")

    -- A completion engine plugin for neovim written in Lua
    use("hrsh7th/nvim-cmp")
    -- Buffer completions
    use("hrsh7th/cmp-buffer")
    -- Path completions
    use("hrsh7th/cmp-path")
    -- Command line completions
    use("hrsh7th/cmp-cmdline")
    -- LuaSnip completion source
    use("saadparwaiz1/cmp_luasnip")

    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")

    -- Git completion source
    use("petertriho/cmp-git")

    -- Turn GitHub Copilot into a cmp source
    use({ "zbirenbaum/copilot-cmp", after = { "copilot.lua" } })

    -- Smoothly navigate between neovim and terminal multiplexer
    use("numToStr/Navigator.nvim")

    -- Smart and powerful comment plugin for neovim.
    -- Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
    use("numToStr/Comment.nvim")

    -- A treesitter plugin for setting the commentstring based on the cursor location in a file
    use("JoosepAlviste/nvim-ts-context-commentstring")

    use("nvim-tree/nvim-web-devicons")

    -- A tabline plugin with re-orderable, auto-sizing, clickable tabs,
    -- icons, nice highlighting, sort-by commands and a magic jump-to-buffer mode
    -- use { "romgrk/barbar.nvim", wants = "nvim-web-devicons" }

    -- A snazzy bufferline (with tabpage integration)
    use({
      "akinsho/bufferline.nvim",
      tag = "v3.*",
      requires = "nvim-tree/nvim-web-devicons",
    })

    -- Add/change/delete surrounding delimiter pairs with ease
    use("kylechui/nvim-surround")

    -- Find, Filter, Preview, Pick
    use({
      "nvim-telescope/telescope.nvim",
      tag = "0.1.0",
      requires = { { "nvim-lua/plenary.nvim" } },
    })
    -- File Browser extension for telescope
    use({
      "nvim-telescope/telescope-file-browser.nvim",
      requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    })

    -- Adds indentation guides to all lines (including empty lines)
    -- use("lukas-reineke/indent-blankline.nvim")

    use("mg979/vim-visual-multi")

    -- Mordern high-performance folds
    -- use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

    -- A neovim lua plugin to help easily manage multiple terminal windows
    use("akinsho/toggleterm.nvim")

    -- A blazing fast and easy to configure
    -- neovim statusline plugin written in pure Lua
    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    -- Magit clone for Neovim that is geared toward the Vim philosophy
    use({
      "TimUntersberger/neogit",
      requires = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
      },
    })

    use("klen/nvim-test")

    -- Super fast git decorations
    use("lewis6991/gitsigns.nvim")

    -- Displays a popup with possible keybindings of the command you started typing
    use("folke/which-key.nvim")

    -- Distraction-free coding
    use("folke/zen-mode.nvim")

    -- A fancy, configurable, notification manager
    use("rcarriga/nvim-notify")

    use({
      "folke/noice.nvim",
      requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    })

    -- A pretty diagnostics, references, telescope results,
    -- quickfix and location list to help you solve all the trouble your code is causing
    use({
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
    })

    -- The superior project management solution
    use("ahmedkhalf/project.nvim")

    -- A file explorer tree for neovim written in Lua
    use({
      "nvim-tree/nvim-tree.lua",
      requires = {
        -- Optional, for file icons
        "nvim-tree/nvim-web-devicons",
      },
      -- Optional, updated every week (see issue #1193)
      tag = "nightly",
    })

    -- A super powerful autopair plugin for Neovim that supports multiple characters
    use("windwp/nvim-autopairs")

    -- Allows to auto close and auto rename html tags
    use("windwp/nvim-ts-autotag")

    -- A better user experience for viewing and interacting with Vim marks
    use("chentoast/marks.nvim")

    -- Modern Go plugin for Neovim, based on gopls, treesitter AST, Dap and a variety of go tools
    use("ray-x/go.nvim")

    -- A high-performance color highlighter
    use("norcalli/nvim-colorizer.lua")

    -- Extensible scrollbar
    use({
      "petertriho/nvim-scrollbar",
      requires = { "kevinhwang91/nvim-hlslens", "lewis6991/gitsigns.nvim" },
    })

    -- Translation
    use("potamides/pantran.nvim")

    -- Themes
    use("EdenEast/nightfox.nvim")
    use("rebelot/kanagawa.nvim")
    use("folke/tokyonight.nvim")
    use("lunarVim/Colorschemes")
    use("lunarvim/synthwave84.nvim")
    use("lunarvim/Onedarker.nvim")
    use("lunarvim/darkplus.nvim")
    use("projekt0n/github-nvim-theme")
    use("sainnhe/gruvbox-material")
    use("yazeed1s/minimal.nvim")
    use("sainnhe/sonokai")
    use("sainnhe/everforest")
    use("sainnhe/edge")
    use("marko-cerovac/material.nvim")
    use("catppuccin/nvim")
    use("shaunsingh/nord.nvim")
    use("ellisonleao/gruvbox.nvim")
    use("nyoom-engineering/nyoom.nvim")
    use("nyoom-engineering/oxocarbon.nvim")
    use("NTBBloodbath/doom-one.nvim")
    use("phha/zenburn.nvim")
    use("JoosepAlviste/palenightfall.nvim")
    use("ray-x/starry.nvim")
    use("bluz71/vim-nightfly-colors")
    use({ "bluz71/vim-moonfly-colors", branch = "cterm-compat" })
    use({
      "glepnir/zephyr-nvim",
      requires = { "nvim-treesitter/nvim-treesitter", opt = true },
    })
    use("rockerBOO/boo-colorscheme-nvim")
    use("kdheepak/monochrome.nvim")
    use({
      "rose-pine/neovim",
      as = "rose-pine",
    })
    use("kvrohit/substrata.nvim")
    use("tiagovla/tokyodark.nvim")
    use("vigoux/oak")

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
      end,
    },
  },
})
