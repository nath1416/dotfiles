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

hl.gesture({
  fingers = 4,
  direction = "left",
  action = function()
    hl.dispatch(hl.dsp.layout("consume_or_expel prev"))
  end,
})

hl.gesture({
  fingers = 3,
  direction = "right",
  action = function()
    hl.dispatch(hl.dsp.focus({ direction = "right" }))
  end,
})


hl.gesture({
  fingers = 3,
  direction = "left",
  action = function()
    hl.dispatch(hl.dsp.focus({ direction = "left" }))
  end,
})

hl.gesture({
  fingers = 4,
  direction = "right",
  action = function()
    hl.dispatch(hl.dsp.layout("consume_or_expel next"))
  end,
})