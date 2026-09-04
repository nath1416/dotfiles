local programs = require("constants.programs")
local launcher = programs.launcher
local mainMod = programs.mainMod

---@class NA.WORKSPACE_DATA
---@field name string
---@field bind string
---@field application string
---@field apply_rule? boolean

---@type NA.WORKSPACE_DATA[]
local specialWorkspaces    = {
    {
        name = "music",
        bind = mainMod .. " + T",
        application = launcher .. programs.music,
    },
    {
        name = "",
        bind = mainMod .. " + S",
        application = launcher .. programs.terminal,
        apply_rule = false,
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
