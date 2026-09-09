hl.config({
    scrolling = {
        fullscreen_on_one_column = false,
        follow_focus             = true,
        column_width             = 1.0,
        focus_fit_method         = 0,
        follow_min_visible       = 1.5,
        explicit_column_widths   = "0.95, 1.0",
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

local customLayout = false

if (not customLayout) then
    goto EOF
end


hl.layout.register("columns", {
    recalculate = function(ctx)
        local n = #ctx.targets
        if n == 0 then
            return
        end

        for i, target in ipairs(ctx.targets) do
            target:place(ctx:column(i, n))
        end
    end,
})

::EOF::
