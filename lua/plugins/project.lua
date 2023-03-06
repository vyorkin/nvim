local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
  return
end

project.setup({
  detection_methods = { "lsp", "pattern" },
  -- Patterns used to detect root dir
  patterns = { ".git", "Makefile", "package.json" },
})

local tele_status_ok, telescope = pcall(require, "telescope")
if tele_status_ok then
  telescope.load_extension("projects")
end
