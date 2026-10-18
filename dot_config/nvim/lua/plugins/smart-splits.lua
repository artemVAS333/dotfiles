return {
  "smart-splits-nvim/smart-splits.nvim",
  version = "^3.0.0",
  lazy = false,
  dependencies = {
    { "smart-splits-nvim/backend-tmux", main = "smart-splits-backend-tmux" },
  },
  opts = {
    ignored_buftypes = { "nofile", "quickfix", "prompt" },
    ignored_filetypes = { "NvimTree", "neo-tree" },
    resize = {
      amount = 3,
    },
    mux = {
      backend = "smart-splits-backend-tmux",
    },
  },
  keys = {
    { "<C-h>", function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" },
    { "<C-j>", function() require("smart-splits").move_cursor_down() end, desc = "Move to below split" },
    { "<C-k>", function() require("smart-splits").move_cursor_up() end, desc = "Move to above split" },
    { "<C-l>", function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" },

    { "<A-h>", function() require("smart-splits").resize_left() end, desc = "Resize split left" },
    { "<A-j>", function() require("smart-splits").resize_down() end, desc = "Resize split down" },
    { "<A-k>", function() require("smart-splits").resize_up() end, desc = "Resize split up" },
    { "<A-l>", function() require("smart-splits").resize_right() end, desc = "Resize split right" },
  },
}
