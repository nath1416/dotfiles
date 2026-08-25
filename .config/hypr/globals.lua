function LOG(data, timeout, color, font_size, icon)
    if data ~= nil then
        hl.notification.create({
            text = data,
            timeout = timeout or 8000,
            color = color,
            font_size = font_size,
            icon = icon,
        })
    end
end
