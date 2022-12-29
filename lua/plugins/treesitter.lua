local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
  return
end

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup({
  ensure_installed = {
    "lua",
    "vim",
    "markdown",
    "markdown_inline",
    "bash",
    "python",
    "help",
    "typescript",
    "ocaml",
    "haskell",
    "rust",
    "gitignore",
    "gitcommit",
    "json",
    "json5",
    "toml",
    "make",
    "cmake",
    "menhir",
    "ocamllex",
  },
  -- List of parsers to ignore installing
  ignore_install = { "" },
  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,
  highlight = {
    -- Use false to disable the whole extension
    enable = true,
    -- List of language that will be disabled
    disable = { "css" },
  },
  autopairs = {
    enable = true,
  },
  indent = { enable = true, disable = { "python", "css" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})
