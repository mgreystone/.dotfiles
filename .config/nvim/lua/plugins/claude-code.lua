return {
  {
    "sivchari/claude-code.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    lazy = false,
    opts = {
      mappings = { toggle = false },
      width = 0.5,
      height = 1,
      position = "right",
      auto_scroll = true,
      start_in_insert = true,
    },
    keys = {
      { "<leader>aw", group = "Worktrees" },
      { "<leader>awc", "<cmd>ClaudeWorktreeCreate<cr>", desc = "Create worktree" },
      { "<leader>aws", "<cmd>ClaudeWorktreeSwitch<cr>", desc = "Switch worktree" },
      { "<leader>awr", "<cmd>ClaudeWorktreeRemove<cr>", desc = "Remove worktree" },
      { "<leader>awl", "<cmd>ClaudeSessions<cr>",       desc = "List sessions" },
      { "<leader>awm", "<cmd>ClaudeMonitor<cr>",        desc = "Toggle session monitor" },
    },
  },
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    lazy = false,
    priority = 900,
    config = true,
    opts = {
      terminal_cmd = "op run --no-masking -- art claude -- --ide",
      diff_opts = {
        open_in_current_tab = false,
      },
    },
    keys = {
      { "<leader>a", group = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
      },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },
}
