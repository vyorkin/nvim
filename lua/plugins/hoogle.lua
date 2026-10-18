-- Local Hoogle search through snacks.picker.
--
-- LazyVim's lang.haskell extra binds <localleader>H to telescope_hoogle, but
-- that spec is `optional = true` and never loads here (the picker is snacks),
-- and <localleader>h only opens hoogle.haskell.org in a browser. This wires the
-- local `hoogle` binary into the snacks picker instead: hoogle ranks the
-- results, so the picker's own fuzzy matcher is kept out of the way — with
-- `live = true` the typed text becomes the search string (not the pattern), so
-- every keystroke re-queries hoogle and nothing is filtered twice.
--
-- The database lives in ~/.hoogle (a symlink to /data/share/hoogle) and is
-- generated from the packages in the cabal store:
--
--   hoogle generate $(ghc-pkg list --simple-output)
--   hoogle generate text containers aeson ...
--
-- Re-run that after adding dependencies if a package is missing from results.

---@param docs? string
---@return string
local function to_markdown(docs)
  if not docs or docs == "" then
    return ""
  end
  return (
    docs
      :gsub("<h4><b>(.-)</b></h4>", "**%1**")
      :gsub("<pre>", "```haskell")
      :gsub("</pre>", "```")
      :gsub("<[^>]+>", "")
      :gsub("&gt;", ">")
      :gsub("&lt;", "<")
      :gsub("&quot;", '"')
      :gsub("&#39;", "'")
      :gsub("&amp;", "&")
  )
end

---@type table<string, snacks.picker.finder.Item[]|false>
local cache = {}

--- Runs `hoogle --json` on the main thread, see `Async:schedule`. Blocking a
--- picker finder coroutine directly is not allowed (`vim.wait` raises E5560 in
--- a fast event context), so the finder hands the wait over to `schedule`.
---@param async? snacks.picker.Async
---@param query string
---@return snacks.picker.finder.Item[]?
local function search(async, query)
  local cached = cache[query]
  if cached ~= nil then
    return cached or nil
  end

  local cmd = { "hoogle", "--json", "--count=100", query }
  local run = function()
    return vim.system(cmd, { text = true }):wait(10000)
  end
  local res = async and async:schedule(run) or run()
  if res.code ~= 0 or not res.stdout or res.stdout == "" then
    if res.code ~= 0 then
      cache[query] = false
      Snacks.notify.warn(("hoogle failed: %s"):format((res.stderr or ""):gsub("%s+$", "")), { title = "Hoogle" })
    end
    return nil
  end

  local ok, data = pcall(vim.json.decode, res.stdout)
  local items = {} ---@type snacks.picker.finder.Item[]
  if ok and type(data) == "table" then
    for i, r in ipairs(data) do
      local mod = r.module and r.module.name or ""
      local pkg = r.package and r.package.name or ""
      local preview = { r.item or "", "" }
      if mod ~= "" then
        preview[#preview + 1] = ("module: `%s`%s"):format(mod, pkg ~= "" and ("  ·  package: `%s`"):format(pkg) or "")
        preview[#preview + 1] = ""
      end
      preview[#preview + 1] = to_markdown(r.docs)
      if r.url and r.url ~= "" then
        preview[#preview + 1] = ""
        preview[#preview + 1] = ("<%s>"):format(r.url)
      end

      items[#items + 1] = {
        idx = i,
        text = r.item or "",
        mod = mod,
        package = pkg,
        url = r.url,
        preview = { text = table.concat(preview, "\n"), ft = "markdown", loc = false },
      }
    end
  end

  cache[query] = items
  return items
end

---@type snacks.picker.finder
local function finder(opts, ctx)
  return function(cb)
    local query = vim.trim(opts.search or "")
    if query == "" then
      return
    end
    for _, item in ipairs(search(ctx.async, query) or {}) do
      cb(item)
    end
  end
end

---@param item snacks.picker.Item
---@return snacks.picker.Highlight[]
local function format(item)
  local ret = {} ---@type snacks.picker.Highlight[]
  ret[1] = { item.text }
  if item.mod and item.mod ~= "" then
    ret[#ret + 1] = { "  " .. item.mod, "SnacksPickerComment" }
  end
  return ret
end

return {
  {
    "folke/snacks.nvim",
    init = function()
      vim.api.nvim_create_user_command("Hoogle", function(opts)
        require("snacks").picker.pick("hoogle", { search = opts.args })
      end, { nargs = "*", desc = "Search the local Hoogle database" })
    end,
    keys = {
      {
        "<localleader>H",
        function()
          require("snacks").picker.pick("hoogle")
        end,
        ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
        desc = "Hoogle (local)",
      },
    },
    opts = {
      picker = {
        sources = {
          hoogle = {
            finder = finder,
            format = format,
            preview = "preview",
            live = true,
            limit = 100,
            sort = { fields = { "idx" } },
            actions = {
              ---@param picker snacks.Picker
              ---@param item snacks.picker.Item
              confirm = function(picker, item)
                picker:close()
                if not item or not item.url or item.url == "" then
                  Snacks.notify.warn("No documentation URL for this result", { title = "Hoogle" })
                  return
                end
                local _, err = vim.ui.open(item.url)
                if err then
                  Snacks.notify.warn(err, { title = "Hoogle" })
                end
              end,
            },
          },
        },
      },
    },
  },
}
