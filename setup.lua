-- file: setup.lua
local module = {}

local SSID = ""
local PASSWORD = ""

local function wifi_wait_ip()  
  if wifi.sta.getip()== nil then
    print("IP unavailable, Waiting...")
  else
    tmr.stop(1)
    print("\n====================================")
    print("ESP8266 mode is: " .. wifi.getmode())
    print("MAC address is: " .. wifi.ap.getmac())
    print("IP is "..wifi.sta.getip())
    print("====================================")
    app.start()
  end
end

local function wifi_start(list_aps)  
    if list_aps then
        for key,value in pairs(list_aps) do
            if config.SSID and config.SSID[key] then
                wifi.setmode(wifi.STATION)
                wifi.sta.config(key,config.SSID[key])
                wifi.sta.connect()
                --config.SSID = nil  -- can save memory
                tmr.alarm(1, 2500, 1, wifi_wait_ip)
            end
        end
    else
        print("Error getting AP list")
    end
end

function module.start()  
  SSID = config.ssid
  PASSWORD = config.pass
  print("Configuring Wifi ...")
  wifi.setmode(wifi.STATION)
  wifi.sta.config(SSID, PASSWORD)
  wifi.sta.connect()
  tmr.alarm(1, 2500, 1, wifi_wait_ip)
  -- wifi.sta.getap(wifi_start)
end

return module 
