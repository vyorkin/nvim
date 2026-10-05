-- Keep ShaDa (marks, registers, search/command history, jumplist) on tmpfs
-- instead of the btrfs state directory.
--
-- Neovim writes ShaDa synchronously while quitting, and on this machine a
-- btrfs transaction commit takes 0.2-3.7 s under load (`commit_stats`), so
-- every `:qa` blocked for roughly 0.5-1.2 s. Writing the same file to tmpfs
-- takes ~0 ms. The persistent copy stays where Neovim has always put it and
-- is mirrored back and forth:
--
--   * on startup: tmpfs is seeded from the backup before Neovim reads ShaDa
--     (config is sourced before the read, so this works within one session)
--   * on exit: the file Neovim already wrote is copied back by a detached
--     process, which never blocks quitting on a btrfs commit
--
-- VimLeave is the right hook, not VimLeavePre: the ShaDa write happens
-- between the two events.

local M = {}

local state = vim.fn.stdpath("state")

--- Persistent ShaDa, on btrfs. Same path Neovim used before this module.
M.backup = state .. "/shada/main.shada"

--- Live ShaDa, on tmpfs.
M.live = string.format("%s/nvim-%d.shada", vim.env.XDG_RUNTIME_DIR or "/tmp", vim.uv.getuid())

local function exists(path)
  return vim.uv.fs_stat(path) ~= nil
end

function M.setup()
  vim.fn.mkdir(vim.fn.fnamemodify(M.backup, ":p:h"), "p")

  if not exists(M.live) and exists(M.backup) then
    vim.uv.fs_copyfile(M.backup, M.live)
  end

  vim.opt.shadafile = M.live

  vim.api.nvim_create_autocmd("VimLeave", {
    desc = "Mirror the tmpfs ShaDa to its btrfs backup, detached",
    callback = function()
      if exists(M.live) then
        -- `detach` keeps Neovim from waiting on the copy, and keeps the copy
        -- alive after Neovim is gone. jobstart needs a list to detach.
        vim.fn.jobstart({ "cp", "-f", M.live, M.backup }, { detach = true })
      end
    end,
  })
end

return M
