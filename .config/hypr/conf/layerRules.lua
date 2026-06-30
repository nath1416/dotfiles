
local waybarBlured = hl.layer_rule({
  name      = "Waybar layer rules",
  match     = { namespace = "waybar" },
  blur= true,
})

waybarBlured:set_enabled(false)
