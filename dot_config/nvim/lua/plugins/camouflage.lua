return {
  {
    "zeybek/camouflage.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      style = "stars", -- 'stars' | 'dotted' | 'text' | 'scramble'
      reveal = {
        follow_cursor = false,
      },
      yank = {
        confirm = true,
        auto_clear_seconds = 30,
      },
    },
    keys = {
      { "<leader>mt", "<cmd>CamouflageToggle<cr>", desc = "Toggle Camouflage" },
      { "<leader>mr", "<cmd>CamouflageReveal<cr>", desc = "Reveal Line" },
      { "<leader>my", "<cmd>CamouflageYank<cr>", desc = "Yank Value" },
      { "<leader>mf", "<cmd>CamouflageFollowCursor<cr>", desc = "Follow Cursor" },
    },
  },
}
