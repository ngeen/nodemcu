-- file: setup.lua
local module = {}

local function motion()
    --app.send_motion()
    print("hareket")
end

function module.start()  
    gpio.mode(config.PIRPIN,gpio.INT,gpio.PULLUP)
    gpio.trig(config.PIRPIN,"up",motion)
end

return module 
