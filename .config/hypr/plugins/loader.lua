-- Enable plugins
hl.on("hyprland.start", function()
    hl.exec_cmd("sleep 5 && hyprpm reload -n")
end)

local plugins = hl.get_loaded_plugins()

if #plugins > 0 then
    for _, plugin in ipairs(plugins) do
        if plugin.name == "scrolloverview" then
            require("plugins.scrollOverView")
            LOG("Plugin loaded with config: " .. plugin.name)
        else
            LOG("Plugin loaded with no config: " .. plugin.name)
        end
    end
else
    LOG("No plugin loaded")
end
