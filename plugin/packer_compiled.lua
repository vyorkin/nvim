-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/vyorkin/.cache/nvim/packer_hererocks/2.1.1710088188/share/lua/5.1/?.lua;/Users/vyorkin/.cache/nvim/packer_hererocks/2.1.1710088188/share/lua/5.1/?/init.lua;/Users/vyorkin/.cache/nvim/packer_hererocks/2.1.1710088188/lib/luarocks/rocks-5.1/?.lua;/Users/vyorkin/.cache/nvim/packer_hererocks/2.1.1710088188/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/vyorkin/.cache/nvim/packer_hererocks/2.1.1710088188/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Base2Tone-nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/Base2Tone-nvim",
    url = "https://github.com/atelierbram/Base2Tone-nvim"
  },
  Colorschemes = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/Colorschemes",
    url = "https://github.com/lunarVim/Colorschemes"
  },
  ["Comment.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["Mies.vim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/Mies.vim",
    url = "https://github.com/jaredgorski/Mies.vim"
  },
  ["Navigator.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/Navigator.nvim",
    url = "https://github.com/numToStr/Navigator.nvim"
  },
  ["Onedarker.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/Onedarker.nvim",
    url = "https://github.com/lunarvim/Onedarker.nvim"
  },
  ["adwaita.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/adwaita.nvim",
    url = "https://github.com/Mofiqul/adwaita.nvim"
  },
  ["boo-colorscheme-nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/boo-colorscheme-nvim",
    url = "https://github.com/rockerBOO/boo-colorscheme-nvim"
  },
  ["calvera-dark.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/calvera-dark.nvim",
    url = "https://github.com/yashguptaz/calvera-dark.nvim"
  },
  ["candle-grey"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/candle-grey",
    url = "https://github.com/aditya-azad/candle-grey"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-git"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/cmp-git",
    url = "https://github.com/petertriho/cmp-git"
  },
  ["cmp-latex-symbols"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/cmp-latex-symbols",
    url = "https://github.com/kdheepak/cmp-latex-symbols"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["cobalt2.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/cobalt2.nvim",
    url = "https://github.com/lalitmee/cobalt2.nvim"
  },
  ["colorbuddy.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/colorbuddy.nvim",
    url = "https://github.com/tjdevries/colorbuddy.nvim"
  },
  ["crates.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/crates.nvim",
    url = "https://github.com/saecki/crates.nvim"
  },
  ["darkplus.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/darkplus.nvim",
    url = "https://github.com/lunarvim/darkplus.nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["doom-one.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/doom-one.nvim",
    url = "https://github.com/NTBBloodbath/doom-one.nvim"
  },
  edge = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/edge",
    url = "https://github.com/sainnhe/edge"
  },
  ["eva01.vim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/eva01.vim",
    url = "https://github.com/hachy/eva01.vim"
  },
  everblush = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/everblush",
    url = "https://github.com/Everblush/nvim"
  },
  everforest = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/everforest",
    url = "https://github.com/sainnhe/everforest"
  },
  ["fluoromachine.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/fluoromachine.nvim",
    url = "https://github.com/maxmx03/fluoromachine.nvim"
  },
  ["fogbell.vim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/fogbell.vim",
    url = "https://github.com/jaredgorski/fogbell.vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["github-nvim-theme"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/github-nvim-theme",
    url = "https://github.com/projekt0n/github-nvim-theme"
  },
  ["go.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/go.nvim",
    url = "https://github.com/ray-x/go.nvim"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["guihua.lua"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/guihua.lua",
    url = "https://github.com/ray-x/guihua.lua"
  },
  ["hlargs.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/hlargs.nvim",
    url = "https://github.com/m-demare/hlargs.nvim"
  },
  ["incline.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/incline.nvim",
    url = "https://github.com/b0o/incline.nvim"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  kimbox = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/kimbox",
    url = "https://github.com/lmburns/kimbox"
  },
  ["komau.vim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/komau.vim",
    url = "https://github.com/ntk148v/komau.vim"
  },
  ["kyotonight.vim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/kyotonight.vim",
    url = "https://github.com/voidekh/kyotonight.vim"
  },
  ["lsp-inlayhints.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/lsp-inlayhints.nvim",
    url = "https://github.com/lvimuser/lsp-inlayhints.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["maani.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/maani.nvim",
    url = "https://github.com/tersetears/maani.nvim"
  },
  ["marks.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/marks.nvim",
    url = "https://github.com/chentoast/marks.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  ["melange-nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/melange-nvim",
    url = "https://github.com/savq/melange-nvim"
  },
  ["mellifluous.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/mellifluous.nvim",
    url = "https://github.com/ramojus/mellifluous.nvim"
  },
  ["mellow.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/mellow.nvim",
    url = "https://github.com/kvrohit/mellow.nvim"
  },
  ["miasma.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/miasma.nvim",
    url = "https://github.com/xero/miasma.nvim"
  },
  ["midnight.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/midnight.nvim",
    url = "https://github.com/dasupradyumna/midnight.nvim"
  },
  ["minimal.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/minimal.nvim",
    url = "https://github.com/yazeed1s/minimal.nvim"
  },
  ["monochrome.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/monochrome.nvim",
    url = "https://github.com/vyorkin/monochrome.nvim"
  },
  ["neg.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/neg.nvim",
    url = "https://github.com/neg-serg/neg.nvim"
  },
  neogit = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/NeogitOrg/neogit"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["nimda.vim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/nimda.vim",
    url = "https://github.com/onur-ozkan/nimda.vim"
  },
  nofrils = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/nofrils",
    url = "https://github.com/robertmeta/nofrils"
  },
  ["noice.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "https://github.com/shaunsingh/nord.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  nvim = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/nvim",
    url = "https://github.com/catppuccin/nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-code-action-menu"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/nvim-code-action-menu",
    url = "https://github.com/weilbith/nvim-code-action-menu"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-python"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/nvim-dap-python",
    url = "https://github.com/mfussenegger/nvim-dap-python"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-surround"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-test"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/nvim-test",
    url = "https://github.com/klen/nvim-test"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ufo"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  oak = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/oak",
    url = "https://github.com/vigoux/oak"
  },
  ["oxocarbon.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/oxocarbon.nvim",
    url = "https://github.com/nyoom-engineering/oxocarbon.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["palenightfall.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/palenightfall.nvim",
    url = "https://github.com/JoosepAlviste/palenightfall.nvim"
  },
  ["pantran.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/pantran.nvim",
    url = "https://github.com/potamides/pantran.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["poimandres.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/poimandres.nvim",
    url = "https://github.com/olivercederborg/poimandres.nvim"
  },
  ["project.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["rose-pine"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  sonokai = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/sonokai",
    url = "https://github.com/sainnhe/sonokai"
  },
  ["starry.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/starry.nvim",
    url = "https://github.com/ray-x/starry.nvim"
  },
  ["substrata.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/substrata.nvim",
    url = "https://github.com/kvrohit/substrata.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["synthwave84.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/synthwave84.nvim",
    url = "https://github.com/lunarvim/synthwave84.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["the-matrix.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/the-matrix.nvim",
    url = "https://github.com/luisiacc/the-matrix.nvim"
  },
  ["toggleterm.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyodark.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/tokyodark.nvim",
    url = "https://github.com/tiagovla/tokyodark.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["tree-sitter-just"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/tree-sitter-just",
    url = "https://github.com/IndianBoy42/tree-sitter-just"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["true-monochrome_vim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/true-monochrome_vim",
    url = "https://github.com/ryanpcmcquen/true-monochrome_vim"
  },
  ["vim-256noir"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/vim-256noir",
    url = "https://github.com/andreasvc/vim-256noir"
  },
  ["vim-boring"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/vim-boring",
    url = "https://github.com/t184256/vim-boring"
  },
  ["vim-huff"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/vim-huff",
    url = "https://github.com/marktoda/vim-huff"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-monotone"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/vim-monotone",
    url = "https://github.com/Lokaltog/vim-monotone"
  },
  ["vim-moonfly-colors"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/vim-moonfly-colors",
    url = "https://github.com/bluz71/vim-moonfly-colors"
  },
  ["vim-nightfly-colors"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/vim-nightfly-colors",
    url = "https://github.com/bluz71/vim-nightfly-colors"
  },
  ["vim-sunbather"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/vim-sunbather",
    url = "https://github.com/nikolvs/vim-sunbather"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  zazen = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/zazen",
    url = "https://github.com/zaki/zazen"
  },
  ["zen-mode.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  },
  ["zenburn.nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/zenburn.nvim",
    url = "https://github.com/phha/zenburn.nvim"
  },
  ["zephyr-nvim"] = {
    loaded = true,
    path = "/Users/vyorkin/.local/share/nvim/site/pack/packer/start/zephyr-nvim",
    url = "https://github.com/glepnir/zephyr-nvim"
  }
}

time([[Defining packer_plugins]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
