local function killOthers()
    local activeWorkspace = hl.get_active_workspace()
    if activeWorkspace == nil then
        return
    end

    local activeWindow = hl.get_active_window()
    if activeWindow == nil then
        return
    end

        hl.notification.create({ text = string.format("Killed: %s windows.",activeWindow.active), timeout = 2000 })


    local count = 0
    local toClose = {}
    local workSpace = hl.get_workspace_windows(activeWorkspace)
    for _, w in pairs(workSpace) do
        if (activeWindow.stable_id ~= w.stable_id) then
            count = count + 1
            hl.notification.create({ text = "Killed: " .. w.pid .. " windows."..activeWindow.pid, timeout = 5000 })
            table.insert(toClose, w)
        end
    end

    -- for _, activeWindow in ipairs(t) do
        
    -- end
    if count > 0 then
        hl.notification.create({ text = "Killed: " .. count .. " windows.", timeout = 2000 })
    end
end

return killOthers

--[[
active_workspace_id=$(hyprctl activeworkspace -j | jq '.id')

clients_to_kill=$(hyprctl clients -j | \
      jq ".[] | select(.workspace.id==${active_workspace_id}) | select(.focusHistoryID!=0)" | \
      jq ".pid"
 )

 kill $(echo "$clients_to_kill")

--]]
