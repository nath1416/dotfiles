local function isProcessRunning(processName)
    local handle = io.popen("pgrep -f " .. processName)
    if handle == nil then
        hl.notification.create({ text = "Unable to get a handle", icon = 2, timeout = 5000 })
        return
    end
    local result = handle:read("*a")
    handle:close()

    return result ~= ""
end

local function launchKdeConnect()
    local deamon = "kdeconnectd"
    if not isProcessRunning(deamon) then
        hl.exec_cmd(deamon)
        hl.notification.create({ text = "Launch: " .. deamon, icon = 5, timeout = 5000 })
    end

    local indicator = "kdeconnect-indicator"
    if not isProcessRunning(indicator) then
        hl.exec_cmd(indicator)
        hl.notification.create({ text = "Launch: " .. indicator, icon = 5, timeout = 5000 })
    end
end

---

hl.on("hyprland.start", function()
    launchKdeConnect()
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd(CONSTANTS.programs.terminal)
end)

hl.on("monitor.added", function()
    hl.exec_cmd("sleep 2 && " .. CONSTANTS.scriptPath .. "wallpaperSwitcher.sh -s reload")
end)


local waybar = hl.layer_rule({ match = { namespace = "waybar" }, blur = true })

waybar:set_enabled(false)

-- hl.on("workspace.special_active", function(workspace, monitor)
--     local workspacename = workspace.name
--     if workspacename then
--         waybar:set_enabled(true)
--         return
--     end
--     waybar:set_enabled(false)
-- end)
