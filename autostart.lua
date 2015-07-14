local component = require("component")
local term = require("term")
local fs = require("filesystem")
local gpu = component.gpu
local wget = loadfile("/bin/wget.lua")
local superlib = require("superlib")

term.clear()
print("Auto start Program...")

if not component.isAvailable("internet") then
	error("Failed: Internet Modul!")
	return
end

local internet = require("internet")

print("Checking Updates...")
--superlib_version = superlib.getVersion()
--versions = superlib.checkVersions()

print("Downloading Files...")

--result = superlib.downloadFile("https://raw.githubusercontent.com/doktorbit/OC_Control/master/lib/superlib.lua", "/lib/superlib.lua")
result = superlib.downloadFile("https://raw.githubusercontent.com/doktorbit/OC_Control/master/programs/r_control/r_control.lua", "/r_control.lua")

local result, reason = os.execute("/r_control.lua")
