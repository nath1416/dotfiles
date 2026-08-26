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


for index, object in ipairs(CONSTANTS.workspace.specialWorkspaces) do
    if object.name == nil or object.application == nil then
        LOG({ text = 'Missing required at index' .. index .. ' fields { name="", application="" } ' })
        goto continue
    end
    if object.bind ~= nil then
        hl.bind(object.bind, hl.dsp.workspace.toggle_special(object.name))
    end

    if object.apply_rule == nil or object.apply_rule then
        hl.workspace_rule({
            workspace        = "special:" .. object.name,
            layout           = "dwindle",
            gaps_in          = 0,
            gaps_out         = 0,
            border_size      = 0,
            no_rounding      = true,
            decorate         = false,
            on_created_empty = object.application
        })
    else
        hl.workspace_rule({
            workspace        = "special:" .. object.name,
            layout           = "dwindle",
            on_created_empty = object.application
        })
    end
    ::continue::
end
