local mainMod = CONSTANTS.mainMod
local programs = CONSTANTS.programs
local scriptPath = CONSTANTS.scriptPath

local musicWorkSpace = CONSTANTS.workspace.musicWorkspace
local specialWorspaceName = CONSTANTS.workspace.extraWorspace

hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(programs.terminal), { submap_universal = true })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(programs.fileManager), { submap_universal = true })
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(programs.browser), { submap_universal = true })
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(programs.browser .. " --private-window"), { submap_universal = true })

hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("pkill " .. programs.menuName .. " || " .. programs.menu),
    { submap_universal = true })

hl.bind("print", hl.dsp.exec_cmd(scriptPath .. "screenshot.sh -s"), { submap_universal = true })
hl.bind("SHIFT + print", hl.dsp.exec_cmd(scriptPath .. "screenshot.sh -f"), { submap_universal = true })

hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("systemctl --user restart waybar"))
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd(scriptPath .. "wallpaperSwitcher.sh set-random"), { submap_universal = true })

hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"))

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("pkill -USR1 waybar"))


hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { submap_universal = true })

hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("hyprlock"), { submap_universal = true })
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("uwsm stop"))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + K", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ workspace = "-1" }))

hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ workspace = "+1" }), { submap_universal = true })
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ workspace = "-1" }), { submap_universal = true })

hl.bind(mainMod .. " + T", hl.dsp.workspace.toggle_special(musicWorkSpace))
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special(specialWorspaceName))

hl.bind(mainMod .. " + V", hl.dsp.window.float())

hl.bind("XF86Favorites", hl.dsp.exec_cmd(scriptPath .. "layoutSwitcher.sh next"))

hl.config({
    binds = {
        drag_threshold = 10,
    }
})

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


-- Scrolling layout keybinds
hl.bind(mainMod .. " + period", hl.dsp.layout("colresize +conf"), { submap_universal = true })
hl.bind(mainMod .. " + SHIFT + period", hl.dsp.layout("colresize -conf"), { submap_universal = true })

hl.bind(mainMod .. " + comma", hl.dsp.layout("consume_or_expel next"), { submap_universal = true })
hl.bind(mainMod .. " + SHIFT + comma", hl.dsp.layout("consume_or_expel prev"), { submap_universal = true })

-- Bash Scripts
hl.bind("XF86MonBrightnessUp",
    hl.dsp.exec_cmd(scriptPath .. "brightness.sh increase"),
    { locked = true, submap_universal = true }
)
hl.bind("XF86MonBrightnessDown",
    hl.dsp.exec_cmd(scriptPath .. "brightness.sh decrease"),
    { locked = true, submap_universal = true }
)

hl.bind("SHIFT + XF86MonBrightnessUp", hl.dsp.exec_cmd("hyprctl hyprsunset temperature 2500"))
hl.bind("SHIFT + XF86MonBrightnessDown", hl.dsp.exec_cmd("hyprctl hyprsunset identity"))


hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(scriptPath .. "volumeControl.sh change 5%+"),
    { locked = true, submap_universal = true }
)
hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd(scriptPath .. "volumeControl.sh change 5%-"),
    { locked = true, submap_universal = true }
)
hl.bind("XF86AudioMute",
    hl.dsp.exec_cmd(scriptPath .. "volumeControl.sh muteSpeaker"),
    { locked = true, submap_universal = true }
)
hl.bind("XF86AudioMicMute",
    hl.dsp.exec_cmd(scriptPath .. "volumeControl.sh muteMic"),
    { locked = true, submap_universal = true }
)

-- Media for external keyboard
hl.bind("XF86AudioPlay",
    hl.dsp.exec_cmd(scriptPath .. "mediaPlayer.sh play-pause"),
    { locked = true, submap_universal = true }
)

hl.bind("XF86AudioNext",
    hl.dsp.exec_cmd(scriptPath .. "mediaPlayer.sh next"),
    { locked = true, submap_universal = true }
)
hl.bind("XF86AudioPrev",
    hl.dsp.exec_cmd(scriptPath .. "mediaPlayer.sh previous"),
    { locked = true, submap_universal = true }
)

-- Media for laptop keyboard, no> media keys on Thinkapd
hl.bind("XF86PickupPhone",
    hl.dsp.exec_cmd(scriptPath .. "mediaPlayer.sh play-pause"),
    { locked = true, submap_universal = true }
)
hl.bind("XF86HangupPhone",
    hl.dsp.exec_cmd(scriptPath .. "mediaPlayer.sh next"),
    { locked = true, submap_universal = true }
)
hl.bind("XF86NotificationCenter",
    hl.dsp.exec_cmd(scriptPath .. "mediaPlayer.sh previous"),
    { locked = true, submap_universal = true }
)


--[[

Missing keybinds:

# Disable laptop screen when lid is closed
bindl = , switch:on:[Lid Switch], exec, hyprctl keyword monitor "eDP-1, disable"
bindl = , switch:off:[Lid Switch], exec, hyprctl keyword monitor "eDP-1, 1920x1200, 0x0, 1"

--]]
