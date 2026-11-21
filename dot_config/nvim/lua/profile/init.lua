local M = {}

local function available(name)
  if not name:match "^[%w_-]+$" then return false end

  local paths = vim.api.nvim_get_runtime_file("lua/profiles/" .. name .. "/init.lua", false)

  return #paths > 0
end

local function resolve()
  local paths = vim.fs.find(".nvim/settings.json", {
    upward = true,
    path = vim.fn.getcwd(),
    type = "file",
    limit = 1,
  })

  local path = paths[1]
  if not path then return nil end

  local ok, config = pcall(function() return vim.json.decode(table.concat(vim.fn.readfile(path), "\n")) end)

  if not ok or type(config) ~= "table" then error("Invalid Neovim profile config: " .. path) end

  local profile = config.profile

  if type(profile) ~= "string" or not available(profile) then error("Unknown Neovim profile: " .. tostring(profile)) end

  return profile
end

M.current = resolve()
vim.g.nvim_profile = M.current or "core"

return M
