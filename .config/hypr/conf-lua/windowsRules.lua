-- Rules for firefox picture in picture window type.
-- Used for youtube video and actually amy picture in picutre content
hl.window_rule({
  name = "Firefox picture in picture",
  match = {
    title = "(.*)(Picture-in-Picture)"
  },

  float = true,
  border_size = 2,
  keep_aspect_ratio = "on",
  dim_around = "on",
  opaque = "on",
  pin = "on",
  no_shadow = "on",
  border_color = "rgb(000000) rgb(000000)",
})

hl.window_rule({
    name = "Float for file-png",
    match = {
        class = "(file-png)"
    },
    float = true
})

hl.window_rule({
    name = "Rule for blueman",
    match = {
        class = "(blueman-manager)"
    },
    float = true,
    size = {"(monitor_w*0.2)", "(monitor_h*0.3)"}

})

hl.window_rule({
    name = "newtwork connection",
    match = {
        class = "(nm-connection-editor)"
    },
    float = true,
})

hl.window_rule({
    name = "Default rule",
    match = {
        class = ".*"
    },
    suppress_event = "maximize"
})

hl.window_rule({
    name = "Wofi rules",
    match = {
        class = "(wofi)"
    },
    border_size = 0,
    stay_focused = true,
})

hl.window_rule({
    name = "mpv keep ratio",
    match = {
        class = "(mpv)"
    },
    keep_aspect_ratio = true,
    opaque = true,
})

--[[
windowrule {
  name = windowrule-5
  float = on
  match:title = .*Extension*
}

windowrule {
  name = windowrule-7
  no_focus = on
  match:class = ^$
  match:title = ^$
  match:xwayland = 1
  match:float = 1
  match:fullscreen = 0
  match:pin = 0
}


# No rounding on the border and no actual borderGap when One window
#windowrule = bordersize 0, floating:0, onworkspace:w[tv1]s[false]
#windowrule {
#  name = no rounding if only window
#  rounding = 0
#  match:float = 0
#  match:workspace = w[tv1]s[false]
#}

windowrule {
  name = rounding only if in special workspace
  border_size = 0
  rounding = 0
  match:float = 0
  match:workspace = f[1]s[false]
}

windowrule {
  name = windowrule-11
  stay_focused = on
  border_size = 0
  move = (min(max((monitor_w*0.2),0),monitor_w-window_w)) (min(max((monitor_h*0.2),0),monitor_h-window_h))
  match:class = (Hellpaper)
}



--]]