local programs = require("conf-lua.programs")

hl.bind("print", hl.dsp.exec_cmd(SCRIPT_PATH .. "screenshot.sh -s"))
hl.bind("SHIFT + print", hl.dsp.exec_cmd(SCRIPT_PATH .. "screenshot.sh -f"))

hl.bind(MAIN_MOD .. " + SHIFT + R", hl.dsp.exec_cmd(SCRIPT_PATH .. "reloadLayers.sh"))
hl.bind(MAIN_MOD .. " + O", hl.dsp.exec_cmd(SCRIPT_PATH .. "wallpaperSwitcher.sh set-random"))
hl.bind("CTRL + Q", hl.dsp.exec_cmd(SCRIPT_PATH .. "killOther.sh"))

hl.bind(MAIN_MOD .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"))

hl.bind(MAIN_MOD .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

hl.bind(MAIN_MOD .. " + Y", hl.dsp.exec_cmd("pkill -USR1 waybar"))

hl.bind(MAIN_MOD .. " + W", hl.dsp.exec_cmd(programs.terminal))
hl.bind(MAIN_MOD .. " + E", hl.dsp.exec_cmd(programs.fileManager))
hl.bind(MAIN_MOD .. " + SPACE", hl.dsp.exec_cmd("pkill " .. programs.menu .. " || " .. programs.menuRun))
hl.bind(MAIN_MOD .. " + B", hl.dsp.exec_cmd(programs.browser))
hl.bind(MAIN_MOD .. " + SHIFT + B", hl.dsp.exec_cmd(programs.browser .. " --private-window"))
hl.bind(MAIN_MOD .. " + T", hl.dsp.exec_cmd(SCRIPT_PATH .. "musicWorspace.sh"))

hl.bind(MAIN_MOD .. " + Q", hl.dsp.window.kill(hl.get_active_window()))

hl.bind(MAIN_MOD .. " + M", hl.dsp.exec_cmd("hyprlock"))
hl.bind(MAIN_MOD .. " + SHIFT + M", hl.dsp.exec_cmd("uwsm stop"))


hl.bind(MAIN_MOD .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(MAIN_MOD .. " + L", hl.dsp.focus({ direction = "right" }))

for i = 1, 10 do
    local key = i % 10
    hl.bind(MAIN_MOD .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(MAIN_MOD .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(MAIN_MOD .. " + CTRL + L", hl.dsp.focus({ workspace = "+1" }))
hl.bind(MAIN_MOD .. " + CTRL + H", hl.dsp.focus({ workspace = "-1" }))

hl.bind(MAIN_MOD .. " + SHIFT + L", hl.dsp.window.move({ workspace = "+1" }))
hl.bind(MAIN_MOD .. " + SHIFT + H", hl.dsp.window.move({ workspace = "-1" }))

local specialWorspaceName = "Extra"

hl.bind(MAIN_MOD .. " + S", hl.dsp.workspace.toggle_special(specialWorspaceName))
hl.bind(MAIN_MOD .. " + SHIFT + S", hl.dsp.workspace.toggle_special(specialWorspaceName))
hl.bind(MAIN_MOD .. " + SHIFT + S", hl.dsp.window.move({ workspace = specialWorspaceName }))


hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(SCRIPT_PATH .. "brightness.sh increase"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(SCRIPT_PATH .. "brightness.sh decrease"), { locked = true })
hl.bind("SHIFT + XF86MonBrightnessUp", hl.dsp.exec_cmd("hyprctl hyprsunset temperature 2500"))
hl.bind("SHIFT + XF86MonBrightnessDown", hl.dsp.exec_cmd("hyprctl hyprsunset identity"))


hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(SCRIPT_PATH .. "volumeControl.sh change 5%+"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(SCRIPT_PATH .. "volumeControl.sh change 5%-"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(SCRIPT_PATH .. "volumeControl.sh muteSpeaker"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(SCRIPT_PATH .. "volumeControl.sh muteMic"), { locked = true })

-- Media for external keyboard
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(SCRIPT_PATH .. "mediaPlayer.sh play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(SCRIPT_PATH .. "mediaPlayer.sh next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(SCRIPT_PATH .. "mediaPlayer.sh previous"), { locked = true })

-- Media for laptop keyboard
hl.bind("XF86PickupPhone", hl.dsp.exec_cmd(SCRIPT_PATH .. "mediaPlayer.sh play-pause"), { locked = true })
hl.bind("XF86HangupPhone", hl.dsp.exec_cmd(SCRIPT_PATH .. "mediaPlayer.sh next"), { locked = true })
hl.bind("XF86NotificationCenter", hl.dsp.exec_cmd(SCRIPT_PATH .. "mediaPlayer.sh previous"), { locked = true })

hl.bind(MAIN_MOD .. " + period", hl.dsp.layout("colresize +conf"))
hl.bind(MAIN_MOD .. " + SHIFT + period", hl.dsp.layout("colresize -conf"))

hl.bind(MAIN_MOD .. " + comma", hl.dsp.layout("consume_or_expel next"))
hl.bind(MAIN_MOD .. " + SHIFT + comma", hl.dsp.layout("consume_or_expel prev"))


hl.bind(MAIN_MOD .. " + V", hl.dsp.window.float())

hl.bind("XF86Favorites", hl.dsp.exec_cmd(SCRIPT_PATH .. "layoutSwitcher.sh next"))

hl.bind(MAIN_MOD .. " + TAB", hl.dsp.focus({ workspace = "previous_per_monitor" }))

hl.config({
    binds = {
        drag_threshold = 10,
    }
})

hl.bind(MAIN_MOD .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(MAIN_MOD .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })



--[[

Missing keybinds:

# Disable laptop screen when lid is closed
bindl = , switch:on:[Lid Switch], exec, hyprctl keyword monitor "eDP-1, disable"
bindl = , switch:off:[Lid Switch], exec, hyprctl keyword monitor "eDP-1, 1920x1200, 0x0, 1"

--]]
