hl.config({
    scrolling = {
        fullscreen_on_one_column = false,
        column_width             = 0.95,
        focus_fit_method         = 0,
        follow_focus             = true,
        follow_min_visible       = 0.2,
        explicit_column_widths   = "0.5, 0.95, 1.0",
        direction                = "right",
    },
})

hl.config({
    dwindle = {
        preserve_split               = true,
        force_split                  = 0,
        smart_split                  = false,
        smart_resizing               = true,
        permanent_direction_override = false,
        special_scale_factor         = 1,
        split_width_multiplier       = 1.0,
        use_active_for_splits        = true,
        default_split_ratio          = 1.0,
        split_bias                   = 0,
        precise_mouse_move           = false,
    },
})

hl.config({
    master = {
        new_status  = "master",
        orientation = "left",
        mfact       = 0.7,
    }
})
