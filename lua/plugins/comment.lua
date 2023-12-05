local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

local status_ok_inlayhints, _ = pcall(require, "lsp-inlayhints")
if not status_ok_inlayhints then
  return
end

comment.setup({
  pre_hook = function(ctx)
    -- For inlay hints
    local line_start = (ctx.srow or ctx.range.srow) - 1
    local line_end = ctx.erow or ctx.range.erow
    require("lsp-inlayhints.core").clear(0, line_start, line_end)
  end,
})
