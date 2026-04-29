-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
---- lua/config/autocmds.lua

-- Dim inactive nvim windows within a focused instance
local dim = vim.api.nvim_create_augroup("DimInactiveWindows", { clear = true })

vim.api.nvim_create_autocmd("WinLeave", {
  group = dim,
  callback = function()
    vim.wo.winhighlight = "Normal:NormalNC"
  end,
})

vim.api.nvim_create_autocmd("WinEnter", {
  group = dim,
  callback = function()
    vim.wo.winhighlight = ""
  end,
})

-- Dim entire nvim instance when tmux focus moves to another pane.
-- We change the global highlight groups directly rather than per-window
-- winhighlight, because snacks floating windows reset winhighlight after we set it.
local active_bg   = "#001c24"
local inactive_bg = "#002b36"

local function set_instance_dim(dimmed)
  local bg = dimmed and inactive_bg or active_bg
  vim.api.nvim_set_hl(0, "Normal",       { bg = bg })
  vim.api.nvim_set_hl(0, "NormalFloat",  { bg = bg })
  vim.api.nvim_set_hl(0, "SnacksNormal", { bg = bg })
end

vim.api.nvim_create_autocmd("FocusLost", {
  group = dim,
  callback = function() set_instance_dim(true) end,
})

vim.api.nvim_create_autocmd("FocusGained", {
  group = dim,
  callback = function() set_instance_dim(false) end,
})
