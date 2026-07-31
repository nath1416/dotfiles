-- Enable plugins
hl.on("hyprland.start", function()
    hl.exec_cmd("sleep 5 && hyprpm reload -n")
end)

-- Load configurations for enabled plugins
if hl.plugin.scrolloverview ~= nil then
    require("plugins.scrollOverView")
end

local a =  hl.get_loaded_plugins()

for i,p in ipairs(a) do
    print(p.author)
    print(p.description)
    print(p.name)
    print(p.version)
end