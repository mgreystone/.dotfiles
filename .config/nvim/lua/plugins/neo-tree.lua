-- ~/.config/nvim/lua/plugins/neo-tree.lua
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    -- Merge into existing opts instead of replacing them
    opts = function(_, opts)
      opts.filesystem = opts.filesystem or {}
      opts.filesystem.filtered_items = vim.tbl_deep_extend("force", opts.filesystem.filtered_items or {}, {
        visible = true, -- show filtered (hidden) items in the tree
        hide_dotfiles = false, -- do not hide dotfiles (like .gitignore, .env)
        hide_gitignored = true, -- do not hide files ignored by .gitignore
      })

      opts.window = opts.window or {}
      opts.window.mappings = vim.tbl_extend("force", opts.window.mappings or {}, {
        ["o"] = "open",
        ["s"] = "open_vsplit",
      })
    end,

    -- Top-level keymaps (normal mode)
    keys = {
      { "<F1>", "<cmd>Neotree toggle<cr>", desc = "Toggle file tree" },
    },
  },
}
