-- Ensure that the led reflect the actual ouput state (Muted or not)
local demoTimer = hl.timer(function()
    local a = hl.dsp.exec_cmd(CONSTANTS.scriptPath .. "volumeControl.sh updateLigths")
    hl.dispatch(a)
end, { timeout = 10000, type = "repeat" })

demoTimer:set_enabled(true)
