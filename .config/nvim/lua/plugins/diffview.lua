return {
  -- "sindrets/diffview.nvim",
  "dlyongemallo/diffview-plus.nvim",
  opts = {
    default_args = {
      DiffviewOpen = { "-w", "--imply-local" },
    },
  },
  config = function(_, opts)
    require("diffview").setup(opts)

    local GitAdapter = require("diffview.vcs.adapters.git").GitAdapter
    local RevType = require("diffview.vcs.rev").RevType
    local orig_show_untracked = GitAdapter.show_untracked
    GitAdapter.show_untracked = function(self, opt)
      if opt and opt.revs and opt.revs.right and opt.revs.right.type == RevType.LOCAL then
        return orig_show_untracked(self, { dv_opt = opt.dv_opt })
      end
      return orig_show_untracked(self, opt)
    end

    local watcher = nil
    local timer = nil

    vim.api.nvim_create_autocmd("User", {
      pattern = "DiffviewViewOpened",
      callback = function()
        watcher = vim.loop.new_fs_event()
        watcher:start(
          vim.fn.getcwd(),
          { recursive = true },
          vim.schedule_wrap(function(err)
            if err then
              return
            end
            if timer then
              timer:stop()
              timer:close()
            end
            timer = vim.loop.new_timer()
            timer:start(
              150,
              0,
              vim.schedule_wrap(function()
                timer = nil
                vim.cmd("checktime")
                pcall(vim.cmd, "DiffviewRefresh")
              end)
            )
          end)
        )
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
        if watcher then
          watcher:stop()
          watcher:close()
          watcher = nil
        end
      end,
    })
  end,
}
