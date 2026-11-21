return {
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        backdrop = 0.99,
        width = 120,
        height = 1,
      },
    },
    keys = {
      { "<C-z>", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
    },
  },
}
