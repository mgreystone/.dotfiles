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
      -- Diagnostics are shown on demand with 'gl' keymap (see keymaps.lua)
      -- Auto-show disabled to avoid conflicts with LSP hover (<C-k>)
    end,
  },
}
