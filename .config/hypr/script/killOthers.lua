local function killOthers()

    local workspace = hl.get_active_workspace()
    if not workspace then
        return
    end

    local activeWindow = hl.get_active_window()
    if not activeWindow then
        return
    end

    local count = 0
    local windows = hl.get_workspace_windows(workspace)

    for _, w in ipairs(windows) do
        if w.stable_id ~= activeWindow.stable_id then
            count = count + 1

            -- Debug notification
            hl.notification.create({
                text = string.format("Killing PID %d (%s)", w.pid, w.title),
                timeout = 2000
            })

            -- Actually kill it
            hl.dispatch(hl.dsp.window.kill(w))
        end
    end

    hl.notification.create({
        text = string.format("Killed %d windows.", count),
        timeout = 2000
    })
end

return killOthers

--[[
active_workspace_id=$(hyprctl activeworkspace -j | jq '.id')

clients_to_kill=$(hyprctl clients -j | \
      jq ".[] | select(.workspace.id==${active_workspace_id}) | select(.focusHistoryID!=0)" | \
      jq ".pid"
 )

 kill $(echo "$clients_to_kill")
 --


return killOthers
--]]
