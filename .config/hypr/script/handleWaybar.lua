CONFIG_PATH = "/home/nathan/.config/waybar/config-gen.jsonc"


local function isProcessRunning(processName)
    local handle = io.popen("pgrep -f " .. processName)
    if handle == nil then
        hl.notification.create({ text = "Unable to get a handle", icon = 2, timeout = 5000 })
        return
    end
    local result = handle:read("*a")
    handle:close()
    return result
end

local function createTmpCOnfig(config)
    local filename = os.tmpname()
    local file = io.open(filename,"w+")
    print(filename)

    file:write(config)
    file:close()


    local cmd = CONSTANTS.programs.launcher .. "waybar -c " .. filename
    local a = hl.dsp.exec_raw(cmd)
    hl.dispatch(a)

    local pid = isProcessRunning("waybar")

    return pid

end


local function startWaybar(monitor)
    local defaul_config = io.open(CONFIG_PATH, "r")

    io.input(defaul_config)
    print(monitor)

    local txt = io.read("*all")
    io.close()

    txt = string.gsub(txt, "**MONITOR", monitor)

    return createTmpCOnfig(txt)
end



local main = {
    laptop = { monitor = "eDP-1" },
    acer = { monitor = "DP-3" }
}

local pids = {}

local function loadWaybar(monitors)
    for name, config in pairs(monitors) do
        local pid = startWaybar(config.monitor)

        -- pids[name] = pid

        print("started", name, config.monitor, "pid:", pid)
    end
    -- return ""
end

-- -- loadWaybar(main)

-- -- later
-- for name, pid in pairs(pids) do
--     print(name, pid)
-- end


-- -- startWaybar("DP-3")

-- -- loadWaybar(main)


hl.bind(CONSTANTS.mainMod .. " + N", loadWaybar(main) )
