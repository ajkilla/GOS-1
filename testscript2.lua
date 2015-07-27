local version = 1.29
require ("DLib")
require("Updater")
up=Updater.new("DrakeSharp/GOS/master/testscript2.lua", "testscript2", version)
if up.newVersion() then up.update() end

local x=44
delay(function()
	notification("lol" ,2000)
end, 3000)

OnLoop(function(myHero)
	
end)