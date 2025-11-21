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
  end,
}
