hl.config({
    decoration = {
        rounding           = 6,
        rounding_power     = 1.5,

        active_opacity     = 1.0,
        inactive_opacity   = 0.85,
        fullscreen_opacity = 1.0,

        dim_modal          = true,

        blur               = {
            enabled        = true,
            size           = 3,
            passes         = 2,
            ignore_opacity = true,

            noise          = 0.01117,
            contrast       = 0.8916,
            brightness     = 0.8172,
            vibrancy       = 0.1696,
        },
    }
})

hl.config({
    decoration = {
        shadow = {
            enabled      = false,
            range        = 4,
            render_power = 3,
            color        = CONSTANTS.colors.shadow,
        },

        glow = {
            enabled = false,
            range   = 10,
            color   = CONSTANTS.colors.on_background,
        },
    }
})
