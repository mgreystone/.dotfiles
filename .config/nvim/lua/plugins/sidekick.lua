return {
  {
    "folke/sidekick.nvim",
    opts = {
      nes = { enabled = false },
      cli = {
        tools = {
          claude = { cmd = { vim.fn.expand("~/bin/_claude") } },
          codex = { cmd = { vim.fn.expand("~/bin/_codex") } },
        },
      },
    },
  },
}