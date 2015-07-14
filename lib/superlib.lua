local version = "0.0.2"
local m = {}

local component = require("component")
local internet = require("internet")
local term = require("term")
local keyboard = require("keyboard")
local event = require("event")
local io = require("io")
local string = require("string")
local text = require("text")
local wget = loadfile("/bin/wget")

if component.isAvailable("internet") then
	internet = true
end

local function downloadRaw(url)
	assert(internet)
	local sContent = ""
	local result, response = pcall(internet.request, url)
	if not result then
		return nil
	end
	for chunk in response do
		sContent = sContent..chunk
	end
	return sContent
end

local function downloadFile(url, path)
	assert(internet)
	return wget("-fg", url, path)
end

function m.getVersion()
	return version
end

function m.checkVersion()
	assert("internet")
	response = downloadFile("https://raw.githubusercontent.com/OC_Control/doktorbit/master/versions.lua", "/tmp/versions.lua")
	versions = loadFile("/tmp/versions.lua")
	return versions, version
end

function m.downloadFile(url, path)
	assert("internet")
	local success, response = pcall(downloadFile, url, path)
	if not success then
		return nil
	end
	return response
end

function m.download(url)
	assert("internet")
	local success, response = pcall(downloadRaw, url)
	if not success then
		return nil
	end
	return response
end

return m