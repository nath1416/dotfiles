

hl.config({
    dwindle = {
        preserve_split = true
    },
    scrolling = {
        fullscreen_on_one_column = true,
        column_width = 0.95,
        focus_fit_method = 0,
        follow_focus = true,
        follow_min_visible = 0.4,
        explicit_column_widths =  "0.5, 0.95, 1.0",
        direction = "right",
    }
})

--[[
master {
    new_status = master
    orientation = right
    mfact = 0.7
}

--]]