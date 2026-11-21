require "core.polish"

local profile = require("profile").current

if profile then
  local module = "profiles." .. profile .. ".polish"

  if vim.fn.filereadable(vim.fn.stdpath "config" .. "/lua/" .. module:gsub("%.", "/") .. ".lua") == 1 then
    require(module)
  end
end
