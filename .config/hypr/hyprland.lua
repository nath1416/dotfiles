require("conf-lua.binds")
require("conf-lua.animations")
require("conf-lua.decorations")
require("conf-lua.gestures")
require("conf-lua.inputs")
require("conf-lua.layouts")
require("conf-lua.monitors")
require("conf-lua.programs")
require("conf-lua.windowsRules")
require("conf-lua.workspace")
require("conf-lua.events")

local colorsVars = require("colors")
local scriptPath = os.getenv("HOME") .. "/.config/hypr/script/"



hl.config({
    general = {
        border_size = 2,

        gaps_in = { top = 3, left = 3, right = 3, bottom = 3 },
        gaps_out = { top = 5, left = 5, right = 5, bottom = 5 },

        col = {
            active_border   = { colors = { colorsVars.outline } },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,
        allow_tearing = false,

        layout = "scrolling",
    },
})

hl.config({
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
    }
})

hl.config({
    xwayland = {
        enabled = true,
        force_zero_scaling = true,
        use_nearest_neighbor = true
    }
})
