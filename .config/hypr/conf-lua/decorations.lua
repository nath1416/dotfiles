hl.config({
    decoration = {
        rounding = 5,
        rounding_power = 2.0,

        active_opacity = 1.0,
        inactive_opacity = 0.90,
        fullscreen_opacity = 1.0,

        dim_modal = true,
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            ignore_opacity = true,

            noise = 0.0117,
            contrast = 0.8916,
            brightness = 0.8172,
            vibrancy = 0.1696,
        },

        shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = 0x1a1a1aee,
        }
    }
})
