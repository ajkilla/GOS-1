

function requireDL(script, address, retry)
  local retry = retry or 0
  local status, module = pcall(require, script)
  
  if not status and retry<4 then
	retry=retry+1
    response=g.request("github", address.."?rand="..math.random(1,10000))
    if response~=nil then
      g.saveScript("Common\\"..script, response) end
    requireDL(script, address, retry)
  else
    if retry==4 then
      MessageBox(0,"Unable to download library "..script,"Error!",0) end

  end
  if retry>0 then
	s, module = pcall(require, script) end
  return module
end
--REGION notifications
Notification={}
local notifications={}
local notificationsActive=false

function Notification.new(message, duration)
	local this = {}
	this.message = message
	this.duration = duration
	
	function this.onLoop(y)
		FillRect(7,y,200,50,0x70000000);
	end
	return this
end


--ENDREGION notifications

--REGION delayed
local delayed={}
local delayedActive=false
function delay(func, t)
	delayedActive=true
	delayed[t+GetTickCount()]=func end


function delayedOnLoop()
	for t, func in pairs(delayed) do
		if t <= GetTickCount() then
			delayed[t] = nil
			if next(delayed) == nil then
				delayedActive=false
			end
			func()
			return
		end
	end
end
--ENDREGION delayed

OnLoop(function()

	if delayedActive then
		delayedOnLoop() end
end)





local version = 0.14

package.cpath=string.gsub(package.path, ".lua", ".dll")
g=require("GOSUtility")

requireDL("Updater", "DrakeSharp/GOS/master/Common/Updater.lua")
up=Updater.new("DrakeSharp/GOS/master/Common/DLib.lua", "Common\\DLib", version)
if up.newVersion() then up.update() end