local vars = require("conf-lua.programs")

local scriptPath = os.getenv("HOME") .. "/.config/hypr/script"
local mainMod = "SUPER"

hl.bind("print", hl.dsp.exec_cmd(scriptPath .. "/screenshot.sh -s"))
hl.bind("SHIFT + print", hl.dsp.exec_cmd(scriptPath .. "/screenshot.sh -f"))

hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd(scriptPath .. "/reloadLayers.sh"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(scriptPath .. "/wallpaperSwitcher.sh set-random"))
hl.bind("CTRL + Q", hl.dsp.exec_cmd(scriptPath .. "/killOther.sh"))

hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"))

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("pkill -USR1 waybar"))

hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(vars.terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(vars.fileManager))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("pkill " .. vars.menu .. " || " .. vars.menuRun))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(vars.browser))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(vars.browser .. " --private-window"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(scriptPath .. "/musicWorspace.sh"))

hl.bind(mainMod .. " + Q", hl.dsp.window.kill(hl.get_active_window()))

hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("uwsm stop"))


hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + CTRL + L", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + CTRL + H", hl.dsp.focus({ workspace = "-1" }))

hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ workspace = "+1" }))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ workspace = "-1" }))

local specialWorspaceName = "Extra"

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special(specialWorspaceName))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.workspace.toggle_special(specialWorspaceName))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = specialWorspaceName }))


hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(scriptPath .. "/brightness.sh increase"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(scriptPath .. "/brightness.sh decrease"))
hl.bind("SHIFT + XF86MonBrightnessUp", hl.dsp.exec_cmd("hyprctl hyprsunset temperature 2500"))
hl.bind("SHIFT + XF86MonBrightnessDown", hl.dsp.exec_cmd("hyprctl hyprsunset identity"))


hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(scriptPath .. "/volumeControl.sh change 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(scriptPath .. "/volumeControl.sh change 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(scriptPath .. "/volumeControl.sh muteSpeaker"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(scriptPath .. "/volumeControl.sh muteMic"))

-- Media for external keyboard
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(scriptPath .. "/mediaPlayer.sh play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(scriptPath .. "/mediaPlayer.sh nest"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(scriptPath .. "/mediaPlayer.sh previous"))

-- Media for laptop keyboard
hl.bind("XF86PickupPhone", hl.dsp.exec_cmd(scriptPath .. "/mediaPlayer.sh play-pause"))
hl.bind("XF86HangupPhone", hl.dsp.exec_cmd(scriptPath .. "/mediaPlayer.sh nest"))
hl.bind("XF86NotificationCenter", hl.dsp.exec_cmd(scriptPath .. "/mediaPlayer.sh previous"))

hl.bind(mainMod .. " + period", hl.dsp.layout("colresize +conf"))
hl.bind(mainMod .. " + SHIFT + period", hl.dsp.layout("colresize -conf"))

hl.bind(mainMod .. " + comma", hl.dsp.layout("consume_or_expel next"))
hl.bind(mainMod .. " + SHIFT + comma", hl.dsp.layout("consume_or_expel prev"))


hl.bind(mainMod .. " + V", hl.dsp.window.float())


hl.config({
    binds = {
        drag_threshold = 10,
    }
})

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

--[[

Missing keybinds:

# Disable laptop screen when lid is closed
bindl = , switch:on:[Lid Switch], exec, hyprctl keyword monitor "eDP-1, disable"
bindl = , switch:off:[Lid Switch], exec, hyprctl keyword monitor "eDP-1, 1920x1200, 0x0, 1"


bind = $mainMod, P, pseudo,
#bind = $mainMod, J, togglesplit, # dwindle

# Up and down
binde = $mainMod CTRL, K, workspace, +1
binde = $mainMod CTRL, J, workspace, -1

bind = $mainMod, U, togglespecialworkspace, Scroll
bind = $mainMod SHIFT, U, movetoworkspace, special:Scroll
#bind = $mainMod SHIFT, S, movetoworkspace,

bind = $mainMod, TAB, workspace, previous_per_monitor
bind = $mainMod SHIFT, TAB, workspace, previous_per_monitor

bind = ,XF86Favorites, exec, $SCRIPT_PATH/layoutSwitcher.sh next
#bind = SHIFT,XF86Display, exec, $SCRIPT_PATH/layoutSwitcher.sh next

--]]
