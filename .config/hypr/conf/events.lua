local function isProcessRunning(processName)
    local handle = io.popen("pgrep -f " .. processName)
    if handle == nil then
        hl.notification.create({ text = "Unable to get a handle", icon = 2, timeout = 5000 })
        return
    end
    local result = handle:read("*a")
    handle:close()

    if result == "" then
        return false
    else
        return true
    end
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


hl.on("hyprland.start", function()
    hl.exec_cmd(CONSTANTS.programs.terminal)
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    launchKdeConnect()
end)

hl.on("monitor.added", function()
    hl.exec_cmd("sleep 2 && " .. CONSTANTS.scriptPath .. "wallpaperSwitcher.sh reload")
end)

-- hl.bind(CONSTANTS.mainMod .. " + N", launchKdeConnect)
