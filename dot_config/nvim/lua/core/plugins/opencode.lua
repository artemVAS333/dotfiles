return {
  "nickjvandyke/opencode.nvim",
  -- version = "*",
  event = "VeryLazy",
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {}

    local map = vim.keymap.set
    map({ "n", "x" }, "<C-a>", function() require("opencode").ask "@this: " end, { desc = "Ask OpenCode…" })
    map({ "n", "x" }, "<C-x>", function() require("opencode").select() end, { desc = "Select OpenCode…" })
    map(
      { "n", "x" },
      "go",
      function() return require("opencode").operator "@this" end,
      { desc = "Append range to OpenCode", expr = true }
    )
    map(
      { "n" },
      "goo",
      function() return require("opencode").operator "@this" .. "_" end,
      { desc = "Append line to OpenCode", expr = true }
    )
    map(
      { "n" },
      "<S-C-u>",
      function() require("opencode").command "session.half.page.up" end,
      { desc = "Scroll OpenCode up" }
    )
    map(
      { "n" },
      "<S-C-d>",
      function() require("opencode").command "session.half.page.down" end,
      { desc = "Scroll OpenCode down" }
    )
  end,
}
