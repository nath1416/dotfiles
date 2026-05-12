hl.gesture({
  fingers = 4,
  direction = "up",
  action = "cursorZoom",
  zoom_level = 1.8
})

hl.gesture({
  fingers = 4,
  direction = "down",
  action = "cursorZoom",
  zoom_level = 1.8
})

hl.gesture({
  fingers = 3,
  direction = "up",
  action = "fullscreen",
})

hl.gesture({
  fingers = 3,
  direction = "down",
  action = "fullscreen",
})

-- local s = function ()
--   hl.notification.create({ text = "I just swiped on my trackpad!", duration = 5000, icon = "ok" })
--   hl.dsp.focus({ direction = "left" })
  
-- end

-- hl.gesture({
--   fingers = 3,
--   direction = "left",
--   action = s,
-- })

--[[
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
gesture = 3, right, dispatcher, movefocus, r
gesture = 3, left, dispatcher, movefocus, l


--]]
