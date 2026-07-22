#!/usr/bin/env lua

local handle = io.popen("hyprctl monitors")
if not handle then return end
local output = handle:read("*a")
handle:close()

local _, monitor_count = output:gsub("Monitor ", "")

if monitor_count > 1 then
    os.execute("hyprctl eval 'hl.monitor({output = \"eDP-1\", disabled = true})'")
else
    print("not docked")
end
