local function safe_require(path)
  local ok, err = pcall(require, path)
  if not ok then
    print("⚠️ Failed to load " .. path .. ": " .. err)
  end
end

local function is_enabled(mod)
  return MODULES[mod] and MODULES[mod].enable ~= false
end

local items = {
  { "spaces", "spaces.spaces" },
  { "front_app", "front_app.front_app" },
  { "calendar", "calendar.calendar" },
  { "battery", "battery.battery" },
  { "wifi", "monitor.wifi" },
  { "volume", "volume.volume" },
  { "cpu", "monitor.cpu" },
  { "mem", "monitor.mem" },
  { "netspeed", "monitor.netspeed" },
}

for _, item in ipairs(items) do
  local mod, path = item[1], item[2]
  if is_enabled(mod) then
    safe_require("items." .. path)
  end
end

-- 🧱 Optional bracket (no border if battery text style)
if is_enabled("battery") and is_enabled("brew") then
  SBAR.add("bracket", "stats_bracket", { "battery", "brew" }, {
    background = {
      color = COLORS.base,
      border_color = COLORS.surface0,
      border_width = MODULES.battery.style == "text" and 0 or 2,
    },
  })
end
