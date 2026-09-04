if (not loadTest) then
    goto EOF
end

LOG({ text = "Loaded text lua file", icon = 1 })



-- local notif = hl.notification.create({
--     text = "This is a test notification",
--     timeout = 5000,  -- 5 seconds
--     color = 0xFF0000FF,  -- Red
--     icon = "info"
-- })

-- notif:pause()
-- print("Notification paused")
-- if notif:is_paused() then
--     print("Yes, it is paused")
-- end

-- -- Do some work while paused...
-- -- os.execute("sleep 2")
-- -- -- Resume the notification (restarts the timeout counter)
-- -- notif:resume()
-- -- print("Notification resumed")

-- -- -- Modify while active
-- -- notif:set_text("Updated text!")

-- -- -- Check if notification is still alive
-- if notif:is_alive() then
--     print("Notification is still active")
-- end

-- -- -- notif:dismiss()




---
---
::EOF::
