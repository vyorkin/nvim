local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
  return
end

local dap_virtual_text_status_ok, dap_virtual_text =
    pcall(require, "nvim-dap-virtual-text")
if not dap_virtual_text_status_ok then
  return
end

dap_virtual_text.setup({
  enabled = true,                     -- Enable this plugin (the default)
  enabled_commands = true,            -- Create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
  highlight_changed_variables = true, -- Highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
  highlight_new_as_changed = false,   -- Highlight new variables in the same way as changed variables (if highlight_changed_variables)
  show_stop_reason = true,            -- Show stop reason when stopped for exceptions
  commented = false,                  -- Prefix virtual text with comment string
  only_first_definition = true,       -- Only show virtual text at first definition (if there are multiple)
  all_references = false,             -- Show virtual text on all all references of the variable (not only definitions)
  clear_on_continue = false,          -- Clear virtual text on "continue" (might cause flickering when stepping)
  --- A callback that determines how a variable is displayed or whether it should be omitted
  display_callback = function(variable, buf, stackframe, node, options)
    if options.virt_text_pos == "inline" then
      return " = " .. variable.value
    else
      return variable.name .. " = " .. variable.value
    end
  end,
  -- Position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
  virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",

  -- Experimental features:
  all_frames = false,      -- Show virtual text for all stack frames not only current. Only works for debugpy on my machine.
  virt_lines = false,      -- Show virtual lines instead of virtual text (will flicker!)
  virt_text_win_col = nil, -- Position the virtual text at a fixed window column (starting from the first text column) ,
  -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
})

dap.adapters.lldb = {
  type = "executable",
  command = vim.env.HOME
      .. "/.vscode/extensions/vadimcn.vscode-lldb-1.9.2/adapter/codelldb",
  name = "lldb",
  args = { "--port", "0" },
}

dap.configurations.rust = {
  name = "Launch",
  type = "lldb",
  request = "launch",
  program = function()
    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
  end,
  cwd = "${workspaceFolder}",
  stopOnEntry = false,
  args = {},
  initCommands = function()
    -- Find out where to look for the pretty printer Python module
    local rustc_sysroot = vim.fn.trim(vim.fn.system("rustc --print sysroot"))

    local script_import = 'command script import "'
        .. rustc_sysroot
        .. '/lib/rustlib/etc/lldb_lookup.py"'
    local commands_file = rustc_sysroot .. "/lib/rustlib/etc/lldb_commands"

    local commands = {}
    local file = io.open(commands_file, "r")
    if file then
      for line in file:lines() do
        table.insert(commands, line)
      end
      file:close()
    end
    table.insert(commands, 1, script_import)

    return commands
  end,
}

dapui.setup({
  expand_lines = true,
  icons = { expanded = "", collapsed = "", circular = "" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  layouts = {
    {
      elements = {
        { id = "scopes",      size = 0.33 },
        { id = "breakpoints", size = 0.17 },
        { id = "stacks",      size = 0.25 },
        { id = "watches",     size = 0.25 },
      },
      size = 0.33,
      position = "right",
    },
    {
      elements = {
        { id = "repl",    size = 0.45 },
        { id = "console", size = 0.55 },
      },
      size = 0.27,
      position = "bottom",
    },
  },
  floating = {
    max_height = 0.9,
    max_width = 0.5,             -- Floats will be treated as percentage of your screen.
    border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
})

vim.fn.sign_define(
  "DapBreakpoint",
  { text = "🔴", texthl = "", linehl = "", numhl = "" }
)
vim.fn.sign_define(
  "DapBreakpointCondition",
  { text = "🔵", texthl = "", linehl = "", numhl = "" }
)

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
