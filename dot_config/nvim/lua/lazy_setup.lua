local profile = require("profile").current

---@type LazySpec
local specs = {
  {
    "AstroNvim/AstroNvim",
    version = "^6",
    import = "astronvim.plugins",
    opts = {
      mapleader = " ",
      maplocalleader = ",",
      icons_enabled = true,
      pin_plugins = nil,
      update_notifications = true,
    },
  },

  { "AstroNvim/astrocommunity" },

  { import = "core" },
}

if profile then table.insert(specs, {
  import = "profiles." .. profile,
}) end

require("lazy").setup(specs, {
  install = { colorscheme = { "astrotheme", "habamax" } },
  ui = { backdrop = 100 },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
})
