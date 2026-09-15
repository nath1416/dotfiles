local mainMod = CONSTANTS.programs.mainMod
local programs = CONSTANTS.programs
local scriptPath = CONSTANTS.scriptPath

-- Mouse
hl.config({
    binds = {
        drag_threshold = 10,
    }
})

local kill_or_start = function(programName, program)
    return hl.dsp.exec_cmd("pkill " .. programName .. " || " .. program)
end


local cycleWorkspace = function()
    local active_special = hl.get_active_special_workspace()
    if active_special then
        return
    end

    local active = hl.get_active_workspace()

    if active == nil then
        return
    end

    if active.special then
        return
    end

    if active.has_fullscreen then
        return
    end


    if not active.visible then
        return
    end


    local sequence = { "dwindle", "scrolling" }
    local current_layout = active.tiled_layout
    local current_index

    for index, layout in ipairs(sequence) do
        if layout == current_layout then
            current_index = index
            break
        end
    end

    if current_index == nil then
        LOG({ text = "Invalid layout name: " .. current_layout })
        return
    end

    local next_layout = sequence[current_index % #sequence + 1]

    hl.workspace_rule({
        layout    = next_layout,
        workspace = active.name,
    })
end

local reload_hyprland_wayabr = function()
    local b = hl.dsp.exec_cmd("systemctl --user restart waybar.service")
    hl.dispatch(b)

    local c = hl.dsp.exec_cmd("hyprctl reload")
    hl.dispatch(c)
end


-- Keybinds Default submap


hl.bind(mainMod .. " + G", cycleWorkspace,
    { submap_universal = true }
)


hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("pkill -USR1 waybar"))
hl.bind(mainMod .. " + SHIFT + Y", reload_hyprland_wayabr)

hl.bind("SHIFT + XF86MonBrightnessUp", hl.dsp.exec_cmd("hyprctl hyprsunset temperature 2500"))
hl.bind("SHIFT + XF86MonBrightnessDown", hl.dsp.exec_cmd("hyprctl hyprsunset identity"))

hl.bind(mainMod .. " + V", hl.dsp.window.float())

hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("systemctl --user restart waybar"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("uwsm stop"))

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


-- Keybinds Universal
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { submap_universal = true })
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(programs.terminal), { submap_universal = true })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(programs.fileManager), { submap_universal = true })
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(programs.browser), { submap_universal = true })
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(programs.browser .. " --private-window"), { submap_universal = true })
hl.bind(mainMod .. " + SPACE", kill_or_start(programs.menuName, programs.menu), { submap_universal = true })

hl.bind("print", hl.dsp.exec_cmd(scriptPath .. "screenshot.sh -s"), { submap_universal = true })
hl.bind("SHIFT + print", hl.dsp.exec_cmd(scriptPath .. "screenshot.sh -f"), { submap_universal = true })

hl.bind(mainMod .. " + U", hl.dsp.exec_cmd(scriptPath .. "wallpaperSwitcher.sh set-random"), { submap_universal = true })
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("hyprlock"), { submap_universal = true })

hl.bind(mainMod .. " + K", hl.dsp.focus({ workspace = "-1" }), { submap_universal = true })
hl.bind(mainMod .. " + J", hl.dsp.focus({ workspace = "+1" }), { submap_universal = true })
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ workspace = "-1" }), { submap_universal = true })
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ workspace = "+1" }), { submap_universal = true })


-- Scrolling layout keybinds
hl.bind(mainMod .. " + period", hl.dsp.layout("colresize +conf"), { submap_universal = true })
hl.bind(mainMod .. " + SHIFT + period", hl.dsp.layout("colresize -conf"), { submap_universal = true })

hl.bind(mainMod .. " + comma", hl.dsp.layout("consume_or_expel next"), { submap_universal = true })
hl.bind(mainMod .. " + SHIFT + comma", hl.dsp.layout("consume_or_expel prev"), { submap_universal = true })

-- Bash Scripts
hl.bind("XF86MonBrightnessUp",
    hl.dsp.exec_cmd(scriptPath .. "brightness.sh increase"),
    { locked = true, submap_universal = true, repeating = true }
)
hl.bind("XF86MonBrightnessDown",
    hl.dsp.exec_cmd(scriptPath .. "brightness.sh decrease"),
    { locked = true, submap_universal = true, repeating = true }
)
hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(scriptPath .. "volumeControl.sh change 5%+"),
    { locked = true, submap_universal = true, repeating = true }
)
hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd(scriptPath .. "volumeControl.sh change 5%-"),
    { locked = true, submap_universal = true, repeating = true }
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
