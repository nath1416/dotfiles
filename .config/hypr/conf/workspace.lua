hl.workspace_rule({
    workspace  = "1",
    default    = true,
    persistent = true,
})


for i = 2, CONSTANTS.workspace.nbWorspacePersistent do
    hl.workspace_rule({
        workspace  = tostring(i),
        persistent = true,
    })
end

hl.workspace_rule({
    workspace        = "special:" .. CONSTANTS.workspace.extraWorspace,
    layout           = "dwindle",
    gaps_in          = 0,
    gaps_out         = 0,
    border_size      = 0,
    no_rounding      = true,
    decorate         = false,
    on_created_empty = "[fullscreen] " .. CONSTANTS.programs.terminal
})

hl.workspace_rule({
    workspace        = "special:" .. CONSTANTS.workspace.musicWorkspace,
    layout           = "dwindle",
    gaps_in          = 0,
    gaps_out         = 0,
    border_size      = 0,
    no_rounding      = true,
    decorate         = false,
    on_created_empty = "[fullscreen] " .. CONSTANTS.programs.music
})
