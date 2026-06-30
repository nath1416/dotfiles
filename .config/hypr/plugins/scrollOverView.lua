

hl.config({
    plugin = {
        scrolloverview = {
            gesture_distance = 300, -- how far is the "max" for the gestureoLL
            scale = 0.65,            -- preferred overview scale
            workspace_gap = 0,
            layout = "vertical",    -- vertical or horizontal
            wallpaper = 0,          -- 0: global only, 1: per-workspace only, 2: both
            blur =false,           -- blur only the main overview wallpaper

            shadow = {
                enabled = false,
                range = 5,
                render_power = 3,
                color = 0xee1a1a1a,
            },
        },
    },
})


local mainMod = CONSTANTS.mainMod

local toggleBind = mainMod .. " + O"

hl.bind(toggleBind, function()
    hl.plugin.scrolloverview.overview("toggle")
end)

local selectClient = function()
    -- Select the clicked window, or just the workspace if no window was clicked, then close the overview.
    hl.plugin.scrolloverview.overview("select")
    hl.plugin.scrolloverview.window("select")
    hl.plugin.scrolloverview.overview("off")
end

hl.define_submap("scrolloverview", function()

    -- Navigation
    hl.bind("H", hl.plugin.scrolloverview.navigate("left"))
    hl.bind("L", hl.plugin.scrolloverview.navigate("right"))
    hl.bind("K", hl.plugin.scrolloverview.navigate("up"))
    hl.bind("J", hl.plugin.scrolloverview.navigate("down"))
    hl.bind(mainMod .. " + H", hl.plugin.scrolloverview.navigate("left"))
    hl.bind(mainMod .. " + L", hl.plugin.scrolloverview.navigate("right"))
    hl.bind(mainMod .. " + K", hl.plugin.scrolloverview.navigate("up"))
    hl.bind(mainMod .. " + J", hl.plugin.scrolloverview.navigate("down"))

    hl.bind(mainMod .. " + Q", hl.plugin.scrolloverview.window("close"))

    -- Select workspace
    hl.bind("RETURN", selectClient)
    hl.bind("mouse:272", selectClient, { mouse = true })

    -- Quit
    hl.bind("ESCAPE", hl.plugin.scrolloverview.overview("off"))
    hl.bind("G", hl.plugin.scrolloverview.overview("off"))

    -- hl.bind("mouse:274", hl.plugin.scrolloverview.window("close"), { mouse = true })
end)
