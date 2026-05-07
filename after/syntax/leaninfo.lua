-- Override lean.nvim's leaninfo syntax defaults.
-- This file loads after syntax/leaninfo.lua (per the after/ convention),
-- so plain nvim_set_hl calls here win over any default=true calls there.
vim.api.nvim_set_hl(0, "leanInfoGoalPrefix", { link = "Keyword" })
vim.api.nvim_set_hl(0, "leanInfoHypName", { link = "Function" })
