return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = "Neogit",
  keys = {
    { "<leader>gg", function() require("neogit").open({ kind = "split_below_all" }) end, desc = "Neogit" },
  },
  opts = {},
  config = function(_, opts)
    require("neogit").setup(opts)
    -- Neogit re-links these groups at startup overriding colorscheme; set them after.
    vim.api.nvim_set_hl(0, "NeogitPopupSwitchEnabled", { fg = "#859900", bold = true })
    vim.api.nvim_set_hl(0, "NeogitPopupSwitchDisabled", { fg = "#586e75" })
    vim.api.nvim_set_hl(0, "NeogitPopupOptionEnabled", { fg = "#859900", bold = true })
    vim.api.nvim_set_hl(0, "NeogitPopupOptionDisabled", { fg = "#586e75" })
    vim.api.nvim_set_hl(0, "NeogitPopupConfigEnabled", { fg = "#859900", bold = true })
    vim.api.nvim_set_hl(0, "NeogitPopupConfigDisabled", { fg = "#586e75" })
  end,
}