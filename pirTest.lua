    inpin=4                     -- Select input pin - GPIO12  
    gpio.mode(inpin,gpio.INT,gpio.PULLUP)  -- attach interrupt to inpin
    
    function motion()
        print(gpio.read(inpin)) 
    end

    gpio.trig(inpin,"both",motion)
