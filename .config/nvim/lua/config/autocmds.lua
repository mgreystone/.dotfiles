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

-- Dim entire nvim instance when tmux focus moves to another pane
vim.api.nvim_create_autocmd("FocusLost", {
  group = dim,
  callback = function()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      vim.wo[win].winhighlight = "Normal:NormalNC"
    end
  end,
})

vim.api.nvim_create_autocmd("FocusGained", {
  group = dim,
  callback = function()
    -- Restore only the active window; others stay dim via WinLeave
    vim.wo.winhighlight = ""
  end,
})
