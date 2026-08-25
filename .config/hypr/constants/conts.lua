local colorsTable             = require("constants.colors")
local programs                = require("constants.programs")
local workspace               = require("constants.workspace")

local defaultLayout           = "scrolling"
local scriptPath              = os.getenv("HOME") .. "/.config/hypr/script/"

local scriptScreenshot        = scriptPath .. "screenshot.sh"
local scriptWallpaperSwitcher = scriptPath .. "wallpaperSwitcher.sh"
local scriptBrightness        = scriptPath .. "brightness.sh"
local scriptVolumeControl     = scriptPath .. "volumeControl.sh"
local scriptMediaPlayer       = scriptPath .. "mediaPlayer.sh "

local constants               = {
    scriptPath    = scriptPath,
    colors        = colorsTable.colors,
    colorsHex     = colorsTable.colorsHex,
    programs      = programs,
    defaultLayout = defaultLayout,
    workspace     = workspace,
    scriptScreenshot = scriptScreenshot,
    scriptWallpaperSwitcher = scriptWallpaperSwitcher,
    scriptBrightness = scriptBrightness,
    scriptVolumeControl = scriptVolumeControl,
    scriptMediaPlayer = scriptMediaPlayer,

}
return constants
