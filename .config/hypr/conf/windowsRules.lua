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

-- force floating windows
hl.window_rule({
    name  = "Blueman floating",
    float = true,
    match = {
        class = "blueman-manager"
    },
})

hl.window_rule({
    name  = "Pwvucontrol floating",
    float = true,
    match = {
        class = "com.saivert.pwvucontrol",
    }
})

hl.window_rule({
    name  = "newtwork connection floating",
    float = true,
    match = {
        class = "nm-connection-editor"
    },
})

hl.window_rule({
    name  = "newtwork connection floating",
    float = true,
    match = {
        class = "com.yubico.yubioath"
    },
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

-- hl.window_rule({
--     name              = "Ensure music workspace has music window fullscreen",
--     fullscreen        = true,
--     match             = {
--         -- workspace         = "special:".. CONSTANTS.workspace.musicWorkspace,
--         class = "chrome-music.apple.com__-Default"
--     },
-- })
