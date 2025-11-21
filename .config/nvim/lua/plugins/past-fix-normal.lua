-- ~/.config/nvim/lua/plugins/paste-fix-normal.lua
return {
  {
    "LazyVim/LazyVim",
    keys = {
      {
        "p",
        function()
          vim.cmd("normal! p") -- do a real paste
          local view = vim.fn.winsaveview()
          -- fix CRLF -> LF, then lone CR -> LF, only in the pasted region
          vim.cmd([[silent keepjumps keeppatterns '[,']s/\r\n/\r/ge]])
          vim.cmd([[silent keepjumps keeppatterns '[,']s/\r/\r/ge]])
          vim.fn.winrestview(view)
        end,
        mode = "n",
        desc = "Paste (after) and normalize CR/CRLF in pasted text",
      },
      {
        "P",
        function()
          vim.cmd("normal! P") -- paste before
          local view = vim.fn.winsaveview()
          vim.cmd([[silent keepjumps keeppatterns '[,']s/\r\n/\r/ge]])
          vim.cmd([[silent keepjumps keeppatterns '[,']s/\r/\r/ge]])
          vim.fn.winrestview(view)
        end,
        mode = "n",
        desc = "Paste (before) and normalize CR/CRLF in pasted text",
      },
    },
  },
}
