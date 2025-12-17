return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false, -- disable inline text
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
          focusable = false,
          style = "minimal",
          header = "",
          prefix = "",
        },
      },
    },
    config = function(_, opts)
      vim.diagnostic.config(opts.diagnostics)
      -- Optional: automatically show diagnostic float on hover
      vim.o.updatetime = 250
      vim.cmd([[
        autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })
      ]])
    end,
  },
}
