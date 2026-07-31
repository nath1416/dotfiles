-- Hyprland Colors
-- Generated with Matugen

-- Wallpaper path
local imageBackground = "{{image}}"

local colors_rgba = {  
<* for name, value in colors *>  
  {{name}} = "rgba({{value.default.hex_alpha_stripped}})",  
<* endfor *>  
}

local colors_hex = {
<* for name, value in colors *>  
  {{name}} = "0x{{value.default.hex_alpha_stripped}}",  
<* endfor *>  
}

return { colors = colors_rgba, colorsHex = colors_hex }
