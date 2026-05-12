hl.workspace_rule({
    workspace = "1",
    default = true,
    persistent = true,
})

local nb_worspace_persistent = 5

for i = 2, nb_worspace_persistent do
    local id = tostring(i)
    hl.workspace_rule({
        workspace = id,
        persistent = true,
    })
end

hl.workspace_rule({
    workspace = "s[true]",
    layout = "dwindle",
})

--[[
workspace = 4, persistent:true,# desc:Acer Technologies XV270U X1 2511033253LEH
workspace = 3, persistent:true,# desc:Acer Technologies XV270U X1 2511033253LEH
workspace = 2, persistent:true,# desc:Acer Technologies XV270U X1 2511033253LEH
workspace = 1, default:true,persistent:true, persistent:true,# desc:Acer Technologies XV270U X1 2511033253LEH

# Dwindle layout for special workspace
workspace = s[true], layout:dwindle

--]]
