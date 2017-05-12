-- file : application.lua
local module = {}  
m = nil

-- Sends a simple ping to the broker
local function send_ping()  
    m:publish(config.ENDPOINT .. "ping","id=" .. config.ID,2,0)
end

-- Sends my id to the broker for registration
local function register_myself()  
    m:subscribe(config.ENDPOINT .. config.ID,2,function(conn)
        print("Successfully subscribed to data endpoint")
        print("Cihaz Adi : " .. config.ID)
    end)

    m:lwt("/lwt", "offline", 2, 0)
end

local function mqtt_start()  
    m = mqtt.Client(config.ID, 120)
    -- register message callback beforehand
    m:on("message", function(conn, topic, data) 
      --if data ~= nil then
      print(topic .. ":" .. data)
      if data == "0" then
        light.close()
        -- do something, we have received a message
      else
        light.open()
      end
    end)
    -- Connect to broker
    m:connect(config.HOST, config.PORT, 0, 1, function(con) 
        register_myself()
        --pir.start()
        light.start()
        -- And then pings each 1000 milliseconds
        tmr.stop(6)
        tmr.alarm(6, 1000, 1, send_ping)
    end) 

end

function module.start()  
  mqtt_start()
end

return module
