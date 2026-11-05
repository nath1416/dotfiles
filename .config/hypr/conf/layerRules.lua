local waybarBlured = hl.layer_rule({
  name  = "Waybar layer rules",
  match = { namespace = "waybar" },
  blur  = true,
})

waybarBlured:set_enabled(false)


---@param w HL.Workspace
local toggle_special_waybar_blur = function(w)
  if waybarBlured:is_enabled() and w == nil then
    waybarBlured:set_enabled(false)
  elseif w ~= nil then
    waybarBlured:set_enabled(true)
  end
end

hl.on("workspace.special_active", toggle_special_waybar_blur)
