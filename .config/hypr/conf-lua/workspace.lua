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