---@type LazySpec
local specs = {
  "AstroNvim/astrocommunity",
}

local profile = require("profile").current

vim.list_extend(specs, require "profiles.core")
vim.list_extend(specs, require("profiles." .. profile))

return specs
