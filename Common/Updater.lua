package.cpath=string.gsub(package.path, ".lua", ".dll")

local Updater = {} 
Updater.__index = Updater

function Updater.create(address, name, version)
   local self = setmetatable({}, Updater)
   self.address=address
   self.version=version
   self.name=name
   self.ut=require("GOSUtility")
   return self
end

function Updater:newVersion()
  self.response=self.ut.request(self.address)
  self.remoteVersion = string.match(self.response, "local version = %d+.%d+")
  self.remoteVersion = tonumber(string.match(self.remoteVersion, "%d+.%d+"))
  return self.remoteVersion>self.version
end

function Updater:update()
  self.ut.saveScript(self.name, self.response)
end

return Updater