return {
  {
    "ishiooon/codex.nvim",
    dependencies = { "folke/snacks.nvim" },
    lazy = false,
    priority = 850,
    opts = {
      auto_start = false,
      terminal_cmd = "~/bin/_codex",
      keymaps = {
        enabled = false,
      },
      diff_opts = {
        open_in_new_tab = true,
      },
    },
    keys = {
      { "<leader>ax", group = "AI/Codex" },
      { "<leader>axS", "<cmd>CodexStart<cr>", desc = "Start Codex integration" },
      { "<leader>axx", "<cmd>Codex<cr>", desc = "Toggle Codex" },
      { "<leader>axf", "<cmd>CodexFocus<cr>", desc = "Focus Codex" },
      { "<leader>axo", "<cmd>CodexOpen<cr>", desc = "Open Codex" },
      { "<leader>axq", "<cmd>CodexClose<cr>", desc = "Close Codex" },
      { "<leader>axm", "<cmd>CodexSelectModel<cr>", desc = "Select Codex model" },
      { "<leader>axb", "<cmd>CodexAdd %<cr>", desc = "Add current buffer" },
      { "<leader>axs", "<cmd>CodexSend<cr>", mode = "v", desc = "Send to Codex" },
      {
        "<leader>axs",
        "<cmd>CodexTreeAdd<cr>",
        desc = "Add file to Codex",
        ft = { "neo-tree", "oil" },
      },
      { "<leader>axa", "<cmd>CodexDiffAccept<cr>", desc = "Accept Codex diff" },
      { "<leader>axd", "<cmd>CodexDiffDeny<cr>", desc = "Deny Codex diff" },
    },
  },
}
