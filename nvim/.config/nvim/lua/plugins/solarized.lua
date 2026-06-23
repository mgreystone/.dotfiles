return {
  "maxmx03/solarized.nvim",
  lazy = false,
  priority = 1000,
  ---@type solarized.config
  opts = {
    styles = {
      types = { italic = false },
      functions = { italic = false },
      parameters = { italic = false },
      comments = { italic = false },
      strings = { italic = false },
      keywords = { italic = false },
      variables = { italic = false },
      constants = { italic = false },
    },
  },
  config = function(_, opts)
    vim.o.termguicolors = true
    vim.o.background = "dark"
    require("solarized").setup(opts)
    vim.cmd.colorscheme("solarized")
    for i = 0, 15 do
      vim.g["terminal_color_" .. i] = nil
    end
    -- Match tmux inactive pane color so unfocused nvim windows dim consistently
    vim.api.nvim_set_hl(0, "Normal",        { bg = "#001c24" })
    vim.api.nvim_set_hl(0, "NormalNC",      { bg = "#002b36" })
    vim.api.nvim_set_hl(0, "SnacksNormal",  { bg = "#001c24" })
    vim.api.nvim_set_hl(0, "SnacksNormalNC", { bg = "#002b36" })
  end,
}
