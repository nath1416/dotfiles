-- Hyprland Colors
-- Generated with Matugen

-- Wallpaper path
local imageBackground = "{{image}}"

local colors = {  
<* for name, value in colors *>  
  {{name}} = "rgba({{value.default.hex_alpha_stripped}})",  
<* endfor *>  
}

return colors
