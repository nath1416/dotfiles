require("conf-lua.animations")
require("conf-lua.binds")
require("conf-lua.decorations")
require("conf-lua.gestures")
require("conf-lua.inputs")
require("conf-lua.layouts")
require("conf-lua.monitors")
require("conf-lua.programs")
require("conf-lua.windowsRules")
require("conf-lua.workspace")


hl.on("hyprland.start", function () 
  hl.exec_cmd("awww-daemon")
end)

hl.config({
    general = {
        border_size = 2,

        gaps_in = 3,
        gaps_out = 5,

        -- col.active_border = $outline,
        col = {
            active_border   = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = true,
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
    }
})
