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


local mainMod = CONSTANTS.programs.mainMod
local toggleBind = mainMod .. " + O"

local selectClient = function()
    hl.plugin.scrolloverview.window("select")
    hl.plugin.scrolloverview.overview("off")
end

local bindsSubmapFunc = function()
    -- Navigation
    hl.bind(mainMod .. " + H", hl.plugin.scrolloverview.navigate("left"))
    hl.bind(mainMod .. " + L", hl.plugin.scrolloverview.navigate("right"))

    hl.bind("ESCAPE", hl.plugin.scrolloverview.overview("off"))

    -- Select workspace
    hl.bind("RETURN", selectClient)
    -- Left click
    hl.bind("mouse:272", selectClient, { mouse = true })
    -- Right click
    hl.bind("mouse:273", selectClient, { mouse = true })
    -- Scroll wheel click
    hl.bind("mouse:274", selectClient, { mouse = true })
end


hl.define_submap("scrolloverview", bindsSubmapFunc)

hl.bind(toggleBind, hl.plugin.scrolloverview.overview("toggle"), { submap_universal = true })
