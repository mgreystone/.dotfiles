return {
  {
    "nickjvandyke/opencode.nvim",
    enabled = false,
    version = "*", -- Latest stable release
    dependencies = {
      {
        ---@module "snacks"
        "folke/snacks.nvim",
        optional = true,
        opts = {
          input = {}, -- Enhances `ask()`
          picker = { -- Enhances `select()`
            actions = {
              opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
            },
            win = {
              input = {
                keys = {
                  ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
                },
              },
            },
          },
        },
      },
    },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        server = {
          start = function()
            require("opencode.terminal").open("~/bin/_opencode --port", {
              split = "right",
              width = math.floor(vim.o.columns * 0.35),
            })
          end,
          stop = function()
            require("opencode.terminal").close()
          end,
          toggle = function()
            require("opencode.terminal").toggle("~/bin/_opencode --port", {
              split = "right",
              width = math.floor(vim.o.columns * 0.35),
            })
          end,
        },
      }

      vim.o.autoread = true -- Required for `opts.events.reload`

      vim.keymap.set({ "n", "x" }, "<C-a>", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode…" })
      vim.keymap.set({ "n", "x" }, "<C-x>", function() require("opencode").select() end,                          { desc = "Execute opencode action…" })
      vim.keymap.set({ "n", "t" }, "<C-.>", function() require("opencode").toggle() end,                          { desc = "Toggle opencode" })

      vim.keymap.set({ "n", "x" }, "go",  function() return require("opencode").operator("@this ") end,        { desc = "Add range to opencode", expr = true })
      vim.keymap.set("n",          "goo", function() return require("opencode").operator("@this ") .. "_" end, { desc = "Add line to opencode", expr = true })

      vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,   { desc = "Scroll opencode up" })
      vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "Scroll opencode down" })

      -- Preserve default increment/decrement since <C-a>/<C-x> are remapped
      vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
      vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
    end,
    keys = {
      { "<leader>ao",  group = "AI/OpenCode" },
      { "<leader>aoo", function() require("opencode").toggle() end,   desc = "Toggle OpenCode" },
      { "<leader>aoa", function() require("opencode").ask("@this: ", { submit = true }) end, mode = { "n", "x" }, desc = "Ask OpenCode" },
      { "<leader>aos", function() require("opencode").select() end,   desc = "Select OpenCode action" },
    },
  },
}
