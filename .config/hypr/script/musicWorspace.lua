

local laucher="/usr/bin/app2unit"

local workspace_name="music"
local app_name="music.apple.com"

local musicWorspace = function ()
   local a =  hl.get_window({class=""})
   hl.notification.create({ text = "".. a.class, timeout=10000})

end

hl.bind("SUPER + D", musicWorspace)
-- hl.dsp.focus({ workspace = "name:" .. workspace_name })

