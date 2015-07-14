local component = require("component")
local term = require("term")
local fs = require("filesystem")
local gpu = component.gpu
local wget = loadfile("/bin/wget.lua")
local superlib = require("superlib")

if not superlib then
  error("ERROR")
  return
end

print("Auto start Program...")

if not component.isAvailable("internet") then
  error("Failed: Internet Modul!")
  return
end

local internet = require("internet")

print("Downloading Files...")

result = superlib.downloadFile("https://raw.githubusercontent.com/doktorbit/OC_Control/master/programs/r_control/r_control.lua", "/r_control.lua")

local result, reason = os.execute("/r_control.lua -s")
