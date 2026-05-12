local vars = require("conf-lua.programs")

local SCRIPT_PATH = os.getenv("HOME") .. "/.config/hypr/script"
local mainMod = "SUPER"

-- hl.bind("switch:on:[Lid Switch]", )

hl.bind("print", hl.dsp.exec_cmd(SCRIPT_PATH .. "/screenshot.sh -s"))
hl.bind("SHIFT + print", hl.dsp.exec_cmd(SCRIPT_PATH .. "/screenshot.sh -f"))

hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd(SCRIPT_PATH .. "/reloadLayers.sh"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(SCRIPT_PATH .. "/wallpaperSwitcher.sh set-random"))
hl.bind("CTRL + Q", hl.dsp.exec_cmd(SCRIPT_PATH .. "/killOther.sh"))

hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"))

--hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen_state(2, 0))
-- bind = $mainMod, F, fullscreenstate, 2 0


hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("pkill -USR1 waybar"))

hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(vars.terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(vars.fileManager))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("pkill " .. vars.menu .. " || " .. vars.menuRun))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(vars.browser))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(vars.browser .. " --private-window"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(SCRIPT_PATH .. "/musicWorspace.sh"))

hl.bind(mainMod .. " + Q", hl.dsp.window.kill(hl.get_active_window()))

hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("uwsm stop"))


hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

for i = 1, 10 do
    local key = i % 10
    -- Switch workspaces with mainMod + [0-9]
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    -- Move active window to a workspace with mainMod + SHIFT + [0-9]
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + CTRL + L", hl.dsp.focus({ workspace =  "+1" }))
hl.bind(mainMod .. " + CTRL + H", hl.dsp.focus({ workspace =  "-1" }))

hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ workspace = "+1" }))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ workspace = "-1" }))

local specialWorspaceName = "Extra"

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special(specialWorspaceName))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.workspace.toggle_special(specialWorspaceName))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = specialWorspaceName }))

--[[
# Disable laptop screen when lid is closed
bindl = , switch:on:[Lid Switch], exec, hyprctl keyword monitor "eDP-1, disable"
bindl = , switch:off:[Lid Switch], exec, hyprctl keyword monitor "eDP-1, 1920x1200, 0x0, 1"



bind = $mainMod, V, togglefloating,
bind = $mainMod, P, pseudo,
#bind = $mainMod, J, togglesplit, # dwindle

#bind = $mainMod, K, movefocus, u
#bind = $mainMod, J, movefocus, d

# Up and down
binde = $mainMod CTRL, K, workspace, +1
binde = $mainMod CTRL, J, workspace, -1

bind = $mainMod, U, togglespecialworkspace, Scroll
bind = $mainMod SHIFT, U, movetoworkspace, special:Scroll
#bind = $mainMod SHIFT, S, movetoworkspace,

bind = $mainMod, TAB, workspace, previous_per_monitor
bind = $mainMod SHIFT, TAB, workspace, previous_per_monitor

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

# Laptop multimedia keys for volume and LCD brightness
bindel = ,XF86AudioRaiseVolume, exec, $SCRIPT_PATH/volumeControl.sh change 5%+
bindel = ,XF86AudioLowerVolume, exec, $SCRIPT_PATH/volumeControl.sh change 5%-

bindel = ,XF86AudioMute, exec, $SCRIPT_PATH/volumeControl.sh muteSpeaker
bindel = ,XF86AudioMicMute, exec, $SCRIPT_PATH/volumeControl.sh muteMic
bindel = ,XF86MonBrightnessUp, exec, $SCRIPT_PATH/brightness.sh increase
bindel = ,XF86MonBrightnessDown, exec, $SCRIPT_PATH/brightness.sh decrease

bindel = ,XF86AudioPlay, exec, $SCRIPT_PATH/mediaPlayer.sh play-pause
bindel = ,XF86AudioNext, exec, $SCRIPT_PATH/mediaPlayer.sh next
bindel = ,XF86AudioPrev, exec, $SCRIPT_PATH/mediaPlayer.sh previous

bindel = ,XF86PickupPhone, exec, $SCRIPT_PATH/mediaPlayer.sh play-pause
bindel = ,XF86HangupPhone, exec, $SCRIPT_PATH/mediaPlayer.sh next
bindel = ,XF86NotificationCenter, exec, $SCRIPT_PATH/mediaPlayer.sh previous

bind = $mainMod, period, layoutmsg, colresize +conf
bind = $mainMod SHIFT, period, layoutmsg, colresize -conf

bind = $mainMod, comma, layoutmsg, swapcol r
bind = $mainMod SHIFT, comma, layoutmsg, swapcol l


bind = ,XF86Favorites, exec, $SCRIPT_PATH/layoutSwitcher.sh next
#bind = SHIFT,XF86Display, exec, $SCRIPT_PATH/layoutSwitcher.sh next

# Hyprsunset
bindel = SHIFT, XF86MonBrightnessUp, exec, hyprctl hyprsunset temperature 2500
bindel = SHIFT, XF86MonBrightnessDown, exec, hyprctl hyprsunset identity

#bind = ,code:164, exec,hyprctl hyprsunset temperature +10
#bind = SHIFT,code:164, exec,hyprctl hyprsunset temperature -10


--]]
