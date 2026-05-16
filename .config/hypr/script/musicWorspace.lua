local programs = require("conf-lua.programs")


local laucher = "/usr/bin/app2unit"

local workspace_name = "music"
local app_name = "music.apple.com"

local function toggleMusic()
   local a = hl.dsp.workspace.toggle_special(workspace_name)
   hl.dispatch(a)
end

local function isMusicOpen()
   local music_windows = hl.get_windows()

   for _, window in ipairs(music_windows) do
      local class = window.class or ""
      local title = window.title or ""

      if class:find(app_name, 1, true) then
         hl.notification.create({
            text = class .. (title ~= "" and " - " .. title or ""),
            timeout = 3000,
         })
         return true
      end
   end

   return false
end

local function openMusic()
   local a = hl.dsp.exec_cmd(programs.music)
   hl.dispatch(a)

end

local function inMusicWorspace()
   local w = hl.get_active_workspace()
         hl.notification.create({
            text = w.name,
            timeout = 3000,
         })
   return w.name == workspace_name
end





local function main()
   -- if inMusicWorspace then
   --    hl.dsp.focus({ workspace = "previous_per_monitor" })
   --    return 
   -- end

   toggleMusic()

   if  not isMusicOpen then
      openMusic()
   end
end


hl.bind(MAIN_MOD .. " + U", main)
hl.bind(MAIN_MOD .. " + I", toggleMusic)


--[[

    if isInMusicWorSpace; then
        previousWorkSpace
        exit 0
    fi

    createWorkSpace

    if ! isMusicOpen; then
        openMusic
    fi
}


-- local musicWorspace = function ()
--    local a =  hl.get_window({class=""})
--    hl.notification.create({ text = "".. a.class, timeout=10000})

-- end

-- hl.bind("SUPER + D", musicWorspace)
-- -- hl.dsp.focus({ workspace = "name:" .. workspace_name })


isMusicOpen(){
    hyprctl -j clients | jq -e --arg app "$APP_NAME" 'any(.[]; .class | contains($app))'
}

openMusic(){
    $LAUNCHER chromium --app="https://$APP_NAME" --password-store=basic &
}

isInMusicWorSpace(){
    hyprctl -j activeworkspace | jq -e --arg ws "$WORKSPACE_NAME" '.name == $ws'
}

previousWorkSpace(){
    hyprctl dispatch 'hl.dsp.focus({ workspace = "previous_per_monitor" })'
}

main "$@"
--]]
