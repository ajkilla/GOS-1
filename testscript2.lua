local version = 1.24

u=require("Updater")
up=u.create("https://raw.githubusercontent.com/DrakeSharp/GOS/master/testscript2.lua", "testscript2", version)
if up:newVersion() then up:update() end

OnLoop(function(myHero)
DrawText(string.format("tick = %f", GetTickCount()),12,0,80,0xFF09E86A);
end)
