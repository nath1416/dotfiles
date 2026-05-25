local launcher = "/usr/bin/app2unit "

local terminal = launcher .. "kitty"
local fileManager = launcher .. "dolphin"
local browser = launcher .. "firefox"
local music = launcher .. 'chromium --app="https://music.apple.com" --password-store=basic'


local menu = "wofi"
local menuRun = string.format(
    "%s %s --show drun",
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
