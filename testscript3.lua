local Updater = {} 
Updater.__index = Updater
function Updater.create(address, version)
   local self = setmetatable({}, Updater)
   self.address=address
   self.version=version
   return self
end

function Updater:isUpToDate()
  local https = require 'ssl.https'
  local resp = {}
  local r, c, h, s = https.request{
    url = self.address,
    sink = ltn12.sink.table(resp),
    protocol = "tlsv1"
  }
  self.response=resp[1]
  local ServerVersion = tonumber(string.match(ServerData, "local version = \"%d+.%d+\""))
  return ServerVersion
end



-- create and use an Account
acc = Updater.create("https://raw.githubusercontent.com/DrakeSharp/GOS/master/testscript2.lua", 1.2)
print (acc:isUpToDate())


