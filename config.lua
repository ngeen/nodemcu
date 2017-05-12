-- file : config.lua
local module = {}

module.ssid = ""
module.pass = ""

module.HOST = "mqtt.shodom.com"  
module.PORT = 1883  
module.ID = node.chipid()

module.ENDPOINT = "nodemcu/"

module.PIRPIN = 4
module.LIGHTPIN = 3

return module  
