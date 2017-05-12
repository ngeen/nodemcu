-- file : init.lua
app = require("application")  
config = require("config")
--pir = require("pir")  
light = require("light")
endUserSetup = require("endUserSetup")
setup = require("setupWifi")

setup.start()
