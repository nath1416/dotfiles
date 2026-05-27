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
require("conf.permisions")


hl.config({
    general = {
        border_size = 1,

        gaps_in = { top = 3, left = 3, right = 3, bottom = 3 },
        gaps_out = { top = 5, left = 5, right = 5, bottom = 5 },

        resize_on_border = false,
        allow_tearing = false,
        no_focus_fallback = false,

        snap = {
            enabled = true,
            window_gap = 10,
        }
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        focus_on_activate = true,
        middle_click_paste = false,
        close_special_on_empty = true,
        on_focus_under_fullscreen = 2,
        lockdead_screen_delay = 2000,
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
    },

})

hl.config({
    general = {
        col = {
            active_border   = { colors = { CONSTANTS.colors.on_background } },
            inactive_border = "rgba(595959ff)",
        },
        layout = CONSTANTS.defaultLayout,
        -- layout = "scrolling",
    },

    binds = {
        hide_special_on_workspace_change = true,
        window_direction_monitor_fallback = true,
    },

    cursor = {
        inactive_timeout = 10,
        warp_on_change_workspace = 1,
    }
})

hl.config({
    ecosystem = {
        enforce_permissions = true,
    },
})
