local function get_diagnostic_label(props)
  local icons = { error = "", warn = "", info = "", hint = "" }
  local label = {}

  for severity, icon in pairs(icons) do
    local n = #vim.diagnostic.get(
      props.buf,
      { severity = vim.diagnostic.severity[string.upper(severity)] }
    )
    if n > 0 then
      table.insert(
        label,
        { icon .. " " .. n .. " ", group = "DiagnosticSign" .. severity }
      )
    end
  end
  if #label > 0 then
    table.insert(label, { "| " })
  end
  return label
end

require("incline").setup({
  debounce_threshold = {
    falling = 50,
    rising = 10,
  },
  hide = {
    cursorline = false,
    focused_win = false,
    only_win = true,
  },
  ignore = {
    buftypes = "special",
    filetypes = {},
    floating_wins = true,
    unlisted_buffers = true,
    wintypes = "special",
  },
  window = {
    zindex = 10,
  },

  render = function(props)
    local filename =
      vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
    local ft_icon, ft_color =
      require("nvim-web-devicons").get_icon_color(filename)
    local modified = vim.api.nvim_buf_get_option(props.buf, "modified")
        and "bold,italic"
      or "bold"

    local buffer = {
      { get_diagnostic_label(props) },
      { ft_icon, guifg = ft_color },
      { " " },
      { filename, gui = modified },
    }
    return buffer
  end,
})
