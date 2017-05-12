local module = {}

function module.start()
    print("*** Initialising ***")

    local wifiMode = wifi.getdefaultmode()
    local wifiStatus = wifi.sta.status()
    
    startWifiEventMonitoring()

    if wifiMode == wifi.SOFTAP or wifiMode == wifi.STATIONAP then
        print("In either SOFTAP or STATIONAP mode, so starting config portal")
        startEndUserSetup()
    end
    
    if(wifiStatus == wifi.STA_GOTIP) then 
        print(" ... already connected, so starting server")
        app.start()
    end
   
end

function startWifiEventMonitoring()
    print("... starting wifi event monitoring")
    wifi.eventmon.register(wifi.eventmon.STA_CONNECTED, function() 
            print("Connected wifi")
        end)
    wifi.eventmon.register(wifi.eventmon.STA_DISCONNECTED, function() 
            print("Disconnected wifi")
        end)
    wifi.eventmon.register(wifi.eventmon.STA_AUTHMODE_CHANGE, function() 
            print("Wifi AuthMode changed")
        end)
    wifi.eventmon.register(wifi.eventmon.STA_GOT_IP, function() 
            print("IP address: " .. wifi.sta.getip())
            app.start()
        end)
    wifi.eventmon.register(wifi.eventmon.STA_DHCP_TIMEOUT, function() 
            print(" - DHCP timeout ... please check your network DHCP settings and restart")
        end)
    wifi.eventmon.register(wifi.eventmon.AP_STACONNECTED, function() 
            print(" - New access point client connected ... no action currently defined")
        end)
    wifi.eventmon.register(wifi.eventmon.AP_STADISCONNECTED, function() 
            print(" - Access point client disconnected ... no action currently defined")
        end)
    --wifi.eventmon.register(wifi.eventmon.AP_PROBEREQRECVED, ...)
end

return module
