return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- This ensures filtered items remain visible (but dimmed)
        hide_dotfiles = false,
        hide_gitignored = false, -- Optional: set to false if you want to see gitignored files too
      },
    },
  },
}
