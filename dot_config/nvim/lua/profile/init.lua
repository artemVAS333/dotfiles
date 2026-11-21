local M = {}

local profiles = {
  web = true,
  systems = true,
  python = true,
  minimal = true,
}

local function resolve()
  local root = vim.fn.getcwd()

  while true do
    local path = root .. "/.nvim/settings.json"

    if vim.fn.filereadable(path) == 1 then
      local ok, config = pcall(function() return vim.json.decode(table.concat(vim.fn.readfile(path), "\n")) end)

      if not ok or type(config) ~= "table" then error("Invalid Neovim profile config: " .. path) end

      if not profiles[config.profile] then error("Unknown Neovim profile: " .. tostring(config.profile)) end

      return config.profile
    end

    local parent = vim.fs.dirname(root)

    if not parent or parent == root then break end

    root = parent
  end

  return "minimal"
end

M.current = resolve()
vim.g.nvim_profile = M.current

return M
