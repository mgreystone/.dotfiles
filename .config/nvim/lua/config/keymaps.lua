-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jk", "<ESC>", { silent = true })

-- Map visual-mode capital S to "gsa" (mini.surround add)
vim.keymap.set("x", "S", "gsa", { remap = true, desc = "Surround selection (vim-surround style)" })

vim.keymap.set("n", "<F1>", function()
  Snacks.explorer()
end, { desc = "Explorer (Snacks)" })

vim.keymap.set("n", "<C-p>", function()
  Snacks.picker.files({
    layout = { preset = "ivy" },
  })
end, { desc = "Explorer (Snacks)" })

vim.keymap.set("n", "gl", function()
  vim.diagnostic.open_float(nil, { focus = false })
end, { desc = "Line diagnostics" })
