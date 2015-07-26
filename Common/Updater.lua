local version = 1.1
package.cpath=string.gsub(package.path, ".lua", ".dll")
Updater={}
local ut=require("GOSUtility")
function Updater.new(address, name, version)
	ut.println("Updater new")
	local this = {}
	this.address=address
	this.version=version
	this.name=name
	this.ut=require("GOSUtility")
	
	function this.newVersion()
		this.response=this.ut.request(this.address.."?rand="..math.random(1,10000))
		this.remoteVersion = string.match(this.response, "local version = %d+.%d+")
		this.remoteVersion = tonumber(string.match(this.remoteVersion, "%d+.%d+"))
	return this.remoteVersion>this.version
	end
	
	function this.update()
		this.ut.saveScript(this.name, this.response)
	end
	return this
end

UPDATEUPDATERHUE=Updater.new("https://raw.githubusercontent.com/DrakeSharp/GOS/master/Common/Updater.lua", "Common\\Updater", version)
if UPDATEUPDATERHUE.newVersion() then UPDATEUPDATERHUE.update() end