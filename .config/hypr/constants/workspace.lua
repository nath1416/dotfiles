local programs = require("constants.programs")
local launcher = programs.launcher
local mainMod = programs.mainMod



---@type NA.WORKSPACE_DATA[]
local specialWorkspaces    = {
    {
        name = "",
        bind = mainMod .. " + T",
        application = launcher .. programs.music,
    },
    {
        name = "",
        bind = mainMod .. " + S",
        application = launcher .. programs.terminal,
        apply_rule = true,
    },
    {
        name = "extra",
        bind = mainMod .. " + SHIFT + S",
        application = launcher .. programs.terminal,
    }
}

local nbWorspacePersistent = 5
local workspace            = {
    nbWorspacePersistent = nbWorspacePersistent,
    specialWorkspaces    = specialWorkspaces
}

return workspace
