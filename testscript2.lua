local version = 1.32

u=require("Updater")
up=u.create("https://raw.githubusercontent.com/DrakeSharp/GOS/master/testscript2.lua", version, "testscript2")
if up:newVersion() then up:update() end


