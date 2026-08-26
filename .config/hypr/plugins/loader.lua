-- Enable plugins
hl.on("hyprland.start", function()
    hl.exec_cmd("sleep 5 && hyprpm reload -n")
end)

local plugins = hl.get_loaded_plugins()

if #plugins > 0 then
    for _, plugin in ipairs(plugins) do
        if plugin.name == "scrolloverview" then
            require("plugins.scrollOverView")
            LOG({ text = "Plugin loaded with config: " .. plugin.name, icon = 5 })
        else
            LOG({ text = "Plugin loaded with no config: " .. plugin.name, icon = 2 })
        end
    end
else
    LOG({ text = "No plugin loaded", icon = 4 })
end


