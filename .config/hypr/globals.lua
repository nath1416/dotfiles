---@class NA.DATA
---@field text string
---@field timeout? number
---@field color? string
---@field font_size? number
---@field icon? number
local _ = {}


---@param object NA.DATA
function LOG(object)
    if object ~= nil and object.text ~= nil then
        hl.notification.create({
            text = object.text,
            timeout = object.timeout or 8000,
            color = object.color ,
            font_size = object.font_size,
            icon = object.icon ,
        })
    end
end
