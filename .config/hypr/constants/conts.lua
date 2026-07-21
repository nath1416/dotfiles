local colors        = require("constants.colors")
local programs      = require("constants.programs")
local workspace     = require("constants.workspace")

local defaultLayout = "scrolling"
local scriptPath    = os.getenv("HOME") .. "/.config/hypr/script/"

local scriptScreenshot = "screenshot.sh"
local scriptWallpaperSwitcher = "wallpaperSwitcher.sh"
local scriptBrightness = "brightness.sh"
local scriptVolumeControl = "volumeControl.sh"
local scriptMediaPlayer = "mediaPlayer.sh "

local constants     = {
    scriptPath    = scriptPath,
    colors        = colors,
    programs      = programs,
    defaultLayout = defaultLayout,
    workspace     = workspace
}
return constants
