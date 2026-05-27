hl.window_rule({
    name = "Firefox picture in picture",
    match = {
        title = "(.*)(Picture-in-Picture)"
    },

    float = true,
    border_size = 1,
    keep_aspect_ratio = true,
    opaque = true,
    pin = true,
    border_color = "rgb(000000)",
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
    size = { "(monitor_w*0.2)", "(monitor_h*0.3)" }

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
--]]
