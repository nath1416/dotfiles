local launcher    = "/usr/bin/app2unit "

local menuName    = "wofi"
local terminal    = launcher .. "kitty"
local fileManager = launcher .. "dolphin"
local browser     = launcher .. "firefox"
local music       = launcher .. 'chromium --app="https://music.apple.com" --password-store=basic'


local menu = launcher .. menuName .. " --show drun"

local vars = {
    terminal    = terminal,
    fileManager = fileManager,
    browser     = browser,
    menu        = menu,
    menuName    = menuName,
    launcher    = launcher,
    music       = music
}

return vars
