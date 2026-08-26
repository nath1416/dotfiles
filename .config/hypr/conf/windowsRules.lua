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

-- other
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


-- force floating windows
---@class NA.FLOATING_WINDOW_DATA
---@field name string
---@field class string
---@type NA.FLOATING_WINDOW_DATA[]
local floatingWindows = {
    {
        name  = "Blueman floating",
        class = "blueman-manager",
    },
    {
        name  = "Pwvucontrol floating",
        class = "com.saivert.pwvucontrol",
    },
    {
        name  = "newtwork connection floating",
        class = "nm-connection-editor",
    },
    {
        name  = "Yubico connect",
        class = "com.yubico.yubioath",
    },
}

for _, window in ipairs(floatingWindows) do
    hl.window_rule({
        name  = window.name,
        float = true,
        match = {
            class = window.class,
        },
    })
end
