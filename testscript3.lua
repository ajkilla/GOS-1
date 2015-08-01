local version = 1
require ("DLib")

local UP=Updater.new("DrakeSharp/GOS/master/testscript3.lua", "testscript3", version)
if UP.newVersion() then UP.update() end

local ssl=menu.addItem(SubMenu.new("Simple Script Loader"))
local loaded=ssl.addItem(SubMenu.new("Loaded scripts"))
local all=ssl.addItem(SubMenu.new("All scripts"))
ssl.addItem(MenuSeparator.new("Don't forget about F6-F6"))
ssl.addItem(MenuSeparator.new("to load/unload selected scripts"))

for i, script in ipairs(listScripts()) do
	if all.addItem(SubMenu.new(script)).addItem(MenuBool.new("Load")).getValue() then
		if prequire(script)~=nil then
			loaded.addItem(MenuSeparator.new(script))
		end
	end
	