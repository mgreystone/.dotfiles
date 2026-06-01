return {
  "sindrets/diffview.nvim",
  opts = {
    default_args = {
      DiffviewOpen = { "-w" },
    },
  },
  config = function(_, opts)
    require("diffview").setup(opts)

    local timer
    vim.api.nvim_create_autocmd("User", {
      pattern = "DiffviewViewOpened",
      callback = function()
        timer = vim.loop.new_timer()
        timer:start(2000, 2000, vim.schedule_wrap(function()
          vim.cmd("checktime")
          pcall(vim.cmd, "DiffviewRefresh")
        end))
      end,
    })
    vim.api.nvim_create_autocmd("User", {
      pattern = "DiffviewViewClosed",
      callback = function()
        if timer then
          timer:stop()
          timer:close()
          timer = nil
        end
      end,
    })
  end,
}
