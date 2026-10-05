
loadTest = false

if (not loadTest) then
    goto EOF
end
---


LOG({ text = "Loaded text lua file", icon = 1 })


local a = hl.dsp.exec_cmd("swaync-client -t -sw")



---
::EOF::
