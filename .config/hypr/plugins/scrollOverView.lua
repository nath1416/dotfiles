hl.config({
    plugin = {
        scrolloverview = {
            gesture_distance = 300,
            scale = 0.65,
            workspace_gap = 0,
            layout = "vertical",
            wallpaper = 0,
            blur = false,
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

local bindsSubmapFunc = function()
    -- Navigation

    hl.bind(mainMod .. " + H", hl.plugin.scrolloverview.navigate("left"))
    hl.bind(mainMod .. " + L", hl.plugin.scrolloverview.navigate("right"))
    hl.bind(mainMod .. " + K", hl.plugin.scrolloverview.navigate("up"))
    hl.bind(mainMod .. " + J", hl.plugin.scrolloverview.navigate("down"))

    hl.bind(mainMod .. " + Q", hl.plugin.scrolloverview.window("close"))

    -- Select workspace
    -- hl.bind("RETURN", selectClient)
    -- hl.bind("mouse:272", selectClient, { mouse = true })

    -- Quit
    hl.bind("ESCAPE", hl.plugin.scrolloverview.overview("off"))
    hl.bind("G", hl.plugin.scrolloverview.overview("off"))

    -- hl.bind("mouse:274", hl.plugin.scrolloverview.window("close"), { mouse = true })
end

hl.define_submap("scrolloverview", bindsSubmapFunc)
