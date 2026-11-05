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

    local workspace_name = "special:" .. object.name
    if object.apply_rule == nil or object.apply_rule then
        hl.workspace_rule({
            workspace   = workspace_name,
            layout      = "dwindle",
            gaps_in     = 0,
            gaps_out    = 0,
            border_size = 0,
            no_rounding = true,
            decorate    = false,
        })
    else
        hl.workspace_rule({
            workspace = workspace_name,
            layout    = "dwindle",
        })
    end

    ---@param w HL.Workspace
    local function on_workspace_created(w)
        if w.name == workspace_name and w.is_empty then
            hl.dispatch(hl.dsp.exec_cmd(object.application))
        end
    end

    hl.on("workspace.created", on_workspace_created)

    ::continue::
end
