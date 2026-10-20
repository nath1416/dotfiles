local launcher    = "/usr/bin/app2unit "

local menuName    = "hyprlauncher -t"

local menu        = launcher .. menuName
local terminal    = launcher .. "kitty"
local fileManager = launcher .. "nautilus -w"
local browser     = launcher .. "firefox"

local music       = launcher .. 'chromium --password-store=basic --app="https://music.apple.com"'

local mainMod     = "SUPER"


local programs = {
    mainMod = mainMod,
    terminal    = terminal,
    fileManager = fileManager,
    browser     = browser,
    menu        = menu,
    menuName    = menuName,
    launcher    = launcher,
    music       = music
}

return programs
