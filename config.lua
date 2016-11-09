-- file : config.lua
local module = {}

module.ssid = "ngeenEv"
module.pass = "Efe22082013"

module.HOST = "shodom.com"  
module.PORT = 1883  
module.ID = node.chipid()

module.ENDPOINT = "nodemcu/"

module.PIRPIN = 4
module.LIGHTPIN = 3

return module  
