local launcher = "/usr/bin/app2unit"

local terminal = launcher .. " kitty"
local fileManager = launcher .. " dolphin"
local browser = launcher .. " firefox"
local menu = "wofi"

local app_name = "music.apple.com"
local music = launcher .. ' chromium --app="https://' .. app_name .. '" --password-store=basic'

local menuRun = string.format(
    "%s %s --color ~/.cache/hellwal/wofi.colors --show drun",
    launcher,
    menu
)

local vars = {
    terminal = terminal,
    fileManager = fileManager,
    browser = browser,
    menu = menu,
    menuRun = menuRun,
    launcher = launcher,
    music = music
}

return vars
