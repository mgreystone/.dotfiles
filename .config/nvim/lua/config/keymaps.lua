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

-- Restore LazyVim <leader>c bindings overwritten by sivchari/claude-code.nvim
vim.keymap.set("n", "<leader>cl", function() Snacks.picker.lsp_config() end, { desc = "Lsp Info" })
vim.keymap.set({ "n", "x" }, "<leader>cc", vim.lsp.codelens.run, { desc = "Run Codelens" })
vim.keymap.set("n", "<leader>cm", "<cmd>Mason<cr>", { desc = "Mason" })

-- Terminal: make it feel like normal Vim windows
vim.keymap.set("t", "jk", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
vim.keymap.set("t", "<C-[>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

vim.keymap.set("t", "<C-w>h", [[<C-\><C-n><C-w>h]], { desc = "Terminal left window" })
vim.keymap.set("t", "<C-w>j", [[<C-\><C-n><C-w>j]], { desc = "Terminal lower window" })
vim.keymap.set("t", "<C-w>k", [[<C-\><C-n><C-w>k]], { desc = "Terminal upper window" })
vim.keymap.set("t", "<C-w>l", [[<C-\><C-n><C-w>l]], { desc = "Terminal right window" })
vim.keymap.set("t", "<C-w>w", [[<C-\><C-n><C-w>w]], { desc = "Terminal next window" })
vim.keymap.set("t", "<C-w>q", [[<C-\><C-n><C-w>q]], { desc = "Terminal close window" })
