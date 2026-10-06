-- general rule
hl.window_rule({
    name           = "Suppress maximing events from all window",
    match          = {
        class = ".*"
    },
    suppress_event = "maximize"
})

-- Specific rules
hl.window_rule({
    name              = "Firefox picture in picture",
    match             = {
        title = "(.*)(Picture-in-Picture)"
    },

    float             = true,
    border_size       = 1,
    keep_aspect_ratio = true,
    opaque            = true,
    pin               = true,
    border_color      = "rgb(000000)",
})

hl.window_rule({
    name         = "Force focus on wofi",
    match        = {
        class = "wofi"
    },
    border_size  = 0,
    stay_focused = true,
})

hl.window_rule({
    name              = "mpv keep ratio",
    match             = {
        class = "mpv"
    },
    keep_aspect_ratio = true,
    opaque            = true,
})

hl.window_rule({
    name    = "Qemu",
    match   = {
        class = "qemu"
    },
    no_blur = true,
    opaque  = true,
})


local floatingWindowsClass = {
    "blueman-manager",
    "com.saivert.pwvucontrol",
    "nm-connection-editor",
    "com.yubico.yubioath",
}

for _, window in ipairs(floatingWindowsClass) do
    hl.window_rule({
        name  = window .. "-float-rule",
        float = true,
        match = {
            class = window,
        },
    })
end
