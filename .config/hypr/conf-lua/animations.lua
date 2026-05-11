hl.curve("easeOutQuint", { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear", { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve("almostLinear", { type = "bezier", points = { {0.5, 0.5}, {0.75, 1.0} } })
hl.curve("quick", { type = "bezier", points = { {0.15, 0}, {0.1, 1} } })

hl.animation({leaf = "global", enabled = true, speed = 1, bezier = "default"})

hl.animation({leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint"})

hl.animation({leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint"})
hl.animation({leaf = "windowsIn", enabled = true, speed = 2.1, bezier = "easeInOutCubic", style = "gnomed"})
hl.animation({leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "gnomed"})

hl.animation({leaf = "fade", enabled = true, speed = 3.03, bezier = "quick"})
hl.animation({leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "quick"})
hl.animation({leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "quick"})

hl.animation({leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint"})
hl.animation({leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade"})
hl.animation({leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade"})

hl.animation({leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear"})
hl.animation({leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear"})

hl.animation({leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade"})
hl.animation({leaf = "workspacesIn", enabled = true, speed = 2, bezier = "almostLinear", style = "slide fade"})
hl.animation({leaf = "workspacesOut", enabled = true, speed = 2, bezier = "almostLinear", style = "fade"})

hl.animation({leaf = "specialWorkspace", enabled = true, speed = 2, bezier = "almostLinear", style = "slide top"})

--[[
animations {
    enabled = yes

    bezier = easeOutQuint,0.23,1,0.32,1
    bezier = easeInOutCubic,0.65,0.05,0.36,1
    bezier = linear,0,0,1,1
    bezier = almostLinear,0.5,0.5,0.75,1.0
    bezier = quick,0.15,0,0.1,1

    animation = global, 1, 1, default

    animation = border, 1, 5.39, easeOutQuint

    animation = windows, 1, 4.79, easeOutQuint
   # animation = windowsIn, 1, 4.1, easeOutQuint, popin 87%
    animation = windowsIn, 1, 2.1, easeInOutCubic, gnomed
    animation = windowsOut, 1, 1.49, linear, gnomed

    animation = fade, 1, 3.03, quick
    animation = fadeIn, 1, 1.73, quick
    animation = fadeOut, 1, 1.46, quick

    animation = layers, 1, 3.81, easeOutQuint
    animation = layersIn, 1, 4, easeOutQuint, fade
    animation = layersOut, 1, 1.5, linear, fade

    animation = fadeLayersIn, 1, 1.79, almostLinear
    animation = fadeLayersOut, 1, 1.39, almostLinear

    animation = workspaces, 1, 1.94, almostLinear, fade
    animation = workspacesIn, 1, 2, almostLinear, slide fade
    animation = workspacesOut, 1, 2, almostLinear, fade

    animation = specialWorkspace, 1, 2, almostLinear, slide top
}


--]]