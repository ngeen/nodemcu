wifi.setmode(wifi.STATIONAP)
    print("burrrr")
    wifi.ap.config({ssid="inhouse",auth=wifi.AUTH_OPEN})
    print("burda")
    enduser_setup.manual(true)
    print("buuurrrrdddaaa")
    enduser_setup.start(
      function()
        print("Connected to wifi as:" .. wifi.sta.getip())
      end,
      function(err, str)
        print("enduser_setup: Err #" .. err .. ": " .. str)
      end
    );