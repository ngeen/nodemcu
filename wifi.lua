local module = {}

function module.start()
    wifi.setmode(wifi.STATIONAP)
    wifi.ap.config({ssid="inhouse",auth=wifi.AUTH_OPEN})
    enduser_setup.manual(true)
    enduser_setup.start(
      function()
        print("Connected to wifi as:" .. wifi.sta.getip())
      end,
      function(err, str)
        print("enduser_setup: Err #" .. err .. ": " .. str)
      end
    );
    app.start()
end

return module