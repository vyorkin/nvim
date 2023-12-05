local treesitter_status_ok, treesitter = pcall(require, "nvim-treesitter")
if not treesitter_status_ok then
  return
end

local configs_status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not configs_status_ok then
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
    "c",
    "dockerfile",
    "kotlin",
    "solidity",
    "menhir",
    "ocamllex",
    "regex",
  },
  auto_install = true,
  -- List of parsers to ignore installing
  ignore_install = { "" },
  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,
  highlight = {
    -- Use false to disable the whole extension
    enable = true,
    -- List of language that will be disabled
    disable = { "css" },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  autopairs = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  endwise = {
    enable = true,
  },
  indent = { enable = true, disable = { "python", "css" } },
})
