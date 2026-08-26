local programs = require("constants.programs")
local launcher = programs.launcher
local mainMod = programs.mainMod

local specialWorkspaces    = {
    {
        name = "music",
        bind = mainMod .. " + T",
        application = launcher .. 'chromium --password-store=basic --app="https://music.apple.com"',
    },
    {
        name = "dwindle",
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
