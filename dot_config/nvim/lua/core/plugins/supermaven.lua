return {
  "supermaven-inc/supermaven-nvim",
  event = "User AstroFile",
  opts = {
    keymaps = {
      -- accept_suggestion = "<Tab>",
      accept_suggestion = "<C-a>",
      clear_suggestion = "<C-]>",
      accept_word = "<C-j>",
    },
    ignore_filetypes = {
      -- cpp = true,
    },
    color = {
      suggestion_color = "#808080",
      cterm = 244,
    },
    disable_inline_completion = false,
    disable_keymaps = false,
  },
}
