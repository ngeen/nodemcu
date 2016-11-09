local module = {}

function module.open()
    gpio.write(config.LIGHTPIN, gpio.HIGH)
end

function module.close()
    gpio.write(config.LIGHTPIN, gpio.LOW)
end

function module.start()  
    gpio.mode(config.LIGHTPIN, gpio.OUTPUT)
    gpio.write(config.LIGHTPIN, gpio.HIGH)
end

return module 
