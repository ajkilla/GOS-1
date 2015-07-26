local version = 0.16

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

function Notification.new(message, duration, drawcolor, textcolor, animationscale, fontsize, y)
	local this = {}
	this.message = message
	this.duration = duration
	this.drawcolor=drawcolor or 0x70000000
	this.textcolor=textcolor or 0xFF71D450
	this.animationscale=animationscale or 1
	this.x=-1000
	this.y=y
	this.toremove=false
	this.creationTime=GetTickCount()+300*animationscale
	
	function this.updateX(tickcount)
		if tickcount>this.creationTime and tickcount<this.creationTime+this.duration  then this.x=7 return end
		if(tickcount>this.creationTime+this.duration) then
			local z=(tickcount-(this.creationTime+this.duration))/animationscale
			this.x=math.ceil(7+0.0018*z*z - 1.23*z)
				if tickcount>this.creationTime+this.duration+300*animationscale then this.toremove=true end
			return
		end
		local z=(this.creationTime-tickcount)/animationscale
		this.x=math.ceil(7+0.0018*z*z - 1.23*z)
	end
		
	function this.onLoop(tickcount)
		this.updateX(tickcount)
		FillRect(this.x,this.y,200,50,this.drawcolor) 
		DrawText("Testing...",14,this.x+2, this.y+5, this.textcolor)
		end
	return this
end

function notification(message, duration, animationscale, fontsize, textcolor, drawcolor)
	drawcolor=drawcolor or 0x70000000
	textcolor=textcolor or 0xFF71D450
	animationscale=animationscale or 1
	for slot = 0, 15, 1 do
		if notifications[slot]==nil then
			notifications[slot]=Notification.new(message, duration, drawcolor, textcolor, animationscale, fontsize, slot*60+5)
			notificationsActive=true
			return
		end
	end
end

function notificationsOnLoop(tickcount)
	for k, value in pairs(notifications) do
		value.onLoop(tickcount)
		if value.toremove==true then notifications[k]=nil end
	end
	if next(notifications) == nil then
		notificationsActive=false
	end
end

--ENDREGION notifications

--REGION delay

local delayed={}
local delayedActive=false

function delay(func, t)
	delayedActive=true
	table.insert(delayed, {t+GetTickCount(), func})
end
	
function delayedOnLoop(tickcount)
	for i, item in pairs(delayed) do
		if item[1] <= tickcount then
			item[2]()
			delayed[i] = nil
		end
	end
	if next(delayed) == nil then
		delayedActive=false
	end
end

--ENDREGION delay

OnLoop(function()
	local tickcount=GetTickCount()
	if delayedActive then
		delayedOnLoop(tickcount) end
	notificationsOnLoop(tickcount)
end)



package.cpath=string.gsub(package.path, ".lua", ".dll")
g=require("GOSUtility")
requireDL("Updater", "DrakeSharp/GOS/master/Common/Updater.lua")
up=Updater.new("DrakeSharp/GOS/master/Common/DLib.lua", "Common\\DLib", version)
if up.newVersion() then
	up.update()
	notification("DLib updated.\n2x F6 to load new version")
	end




