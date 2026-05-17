local colors = require("constants.colors")
local programs = require("constants.programs")

local scriptPath = os.getenv("HOME") .. "/.config/hypr/script/"
local mainMod = "SUPER"

local musicWorkSpace = "music"

local nbWorspacePersistent = 5


local constants = {
    mainMod = mainMod,
    scriptPath = scriptPath,
    colors = colors,
    programs = programs,
    musicWorkSpaceName = musicWorkSpace,
    nbPersistentWorkspace = nbWorspacePersistent
}

return constants
