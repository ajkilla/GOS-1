function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end



local https = require 'ssl.https'
local resp = {}
local r, c, h, s = https.request{
    url = "https://github.com",
    sink = ltn12.sink.table(resp),
    protocol = "tlsv1"
}
print (dump(resp))