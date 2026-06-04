local colors        = require("constants.colors")
local programs      = require("constants.programs")
local workspace     = require("constants.workspace")

local mainMod       = "SUPER"
local defaultLayout = "scrolling"
local scriptPath    = os.getenv("HOME") .. "/.config/hypr/script/"

local constants     = {
    mainMod       = mainMod,
    scriptPath    = scriptPath,
    colors        = colors,
    programs      = programs,
    defaultLayout = defaultLayout,
    workspace     = workspace
}
return constants
