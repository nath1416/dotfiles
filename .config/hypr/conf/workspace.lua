hl.workspace_rule({
    workspace = "1",
    default = true,
    persistent = true,
})


for i = 2, CONSTANTS.nbPersistentWorkspace do
    hl.workspace_rule({
        workspace = tostring(i),
        persistent = true,
    })
end

hl.workspace_rule({
    workspace = "s[true]",
    layout = "dwindle",
    gaps_in = 0,
    gaps_out = 0,
    border_size = 0,
    no_rounding = true,
    decorate = false,
})

hl.workspace_rule({
    workspace = "special:music",
    layout = "dwindle",
    gaps_in = 0,
    gaps_out = 0,
    border_size = 0,
    no_rounding = true,
    decorate = false,
    on_created_empty = CONSTANTS.programs.music
})
