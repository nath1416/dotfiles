-- Load configurations for enabled plugins

if hl.plugin.scrolloverview ~= nil then
    -- hl.notification.create({text = "Loading scrolloverview config", timeout = 5000})
    require("plugins.scrollOverView")
end

