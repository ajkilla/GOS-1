package.cpath=string.gsub(package.path, ".lua", ".dll")
g=require("GOSUtility")

function requireDL(script, address, retry)
  retry = retry or 0
  local status, module = pcall(require, script)
  ret = status and module or nil
  
  if ret==nil and retry<5 then
    print(retry)
    response=g.request(address.."?rand="..math.random(1,10000))
    if response~="Not Found" then
      g.saveScript("Common\\"..script, response) end
    requireDL(script, address, retry+1)
  else
    if retry==5 then
      MessageBox(0,"Unable to download library "..script,"Error!",0); end
    return ret
  end
end