hl.config({
    plugin = {
        scrolloverview = {
            gesture_distance = 300,
            scale = 0.65,
            workspace_gap = 0,
            layout = "vertical",
            wallpaper = 2,
            blur = true,
            shadow = {
                enabled = false,
                range = 2,
                render_power = 0,
                -- color = 0xee1a1a1a,
                -- color = CONSTANTS.colorsHex.error
            },
        },
    },
})



-- Function
local selectClient = function()
    hl.plugin.scrolloverview.window("select")
    hl.plugin.scrolloverview.overview("off")
end

-- Binds

local mainMod = CONSTANTS.programs.mainMod
local toggleBind = mainMod .. " + O"

local bindsSubmapFunc = function()
    -- Navigation
    hl.bind(mainMod .. " + H", hl.plugin.scrolloverview.navigate("left"))
    hl.bind(mainMod .. " + L", hl.plugin.scrolloverview.navigate("right"))

    hl.bind("ESCAPE", hl.plugin.scrolloverview.overview("off"))

    -- Select workspace
    hl.bind("RETURN", hl.plugin.scrolloverview.overview("off")
    )
    -- Left click
    hl.bind("mouse:272", selectClient, { mouse = true })
    -- Right click
    hl.bind("mouse:273", selectClient, { mouse = true })
    -- Scroll wheel click
    hl.bind("mouse:274", selectClient, { mouse = true })
end


hl.define_submap("scrolloverview", bindsSubmapFunc)

local overviewOpen = function()
    hl.plugin.scrolloverview.overview("toggle")
end

hl.bind(toggleBind, overviewOpen, { submap_universal = true })
