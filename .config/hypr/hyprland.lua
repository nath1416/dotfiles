CONSTANTS = require("constants.conts")

require("conf.binds")
require("conf.animations")
require("conf.decorations")
require("conf.gestures")
require("conf.inputs")
require("conf.layouts")
require("conf.monitors")
require("conf.windowsRules")
require("conf.workspace")
require("conf.events")


hl.config({
    general = {
        border_size = 2,

        gaps_in = { top = 3, left = 3, right = 3, bottom = 3 },
        gaps_out = { top = 5, left = 5, right = 5, bottom = 5 },

        resize_on_border = false,
        allow_tearing = false,

        layout = "scrolling",
    },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        focus_on_activate = true,
        middle_click_paste = false,
    },

    ecosystem = {
        no_donation_nag = true,
    },

    animations = {
        enabled = true,
    },
    xwayland = {
        enabled = true,
        force_zero_scaling = true,
        use_nearest_neighbor = true
    }
})

hl.config({
    general = {
        col = {
            active_border   = { colors = { CONSTANTS.colors.outline } },
            inactive_border = "rgba(595959aa)",
        },
    }
})
