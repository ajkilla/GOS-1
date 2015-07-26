local version = 1.28
require ("DLib")
require("Updater")
up=Updater.new("DrakeSharp/GOS/master/testscript2.lua", "testscript2", version)
if up.newVersion() then up.update() end

local x=44
delay(function()
	delay(function()
	MoveToXYZ(0, 0,0 )
end, 2000)
end, 1000)
z=Notification.new("1", 1)
OnLoop(function(myHero)
	DrawText(string.format("tick = %d", x),12,0,80,0xFF09E86A);
	z.onLoop(400)
end)