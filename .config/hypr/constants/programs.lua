local launcher    = "/usr/bin/app2unit "

local menuName    = "wofi"

local menu = launcher .. menuName .. " --show drun"
local terminal    = launcher .. "kitty"
local fileManager = launcher .. "dolphin"
local browser     = launcher .. "firefox"

-- local music       = launcher .. 'chromium --password-store=basic --app="https://navidrome.data.nasservice.net"'
local music       = launcher .. 'chromium --password-store=basic --app="https://music.apple.com"'

local mainMod  = "SUPER"


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
