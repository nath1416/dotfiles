

hl.on("hyprland.start", function()
    hl.exec_cmd(CONSTANTS.scriptPath .. "wallpaperSwitcher.sh reload")
    hl.exec_cmd("kitty")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

hl.on("monitor.added", function()
    hl.exec_cmd("sleep 2 && " .. CONSTANTS.scriptPath .. "wallpaperSwitcher.sh reload")
end)
