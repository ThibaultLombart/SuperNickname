prefix = "-- SUPERNICKNAME --"

print("-- SUPERNICKNAME INITIALIZATION --")

local directoryName = "supernickname"
local directoryNameLanguage = directoryName .. "/languages"

if not file.Exists(directoryName,"DATA") then
    file.CreateDir(directoryName)
    file.CreateDir(directoryNameLanguage)
end

if not file.Exists(directoryNameLanguage,"DATA") then
    file.CreateDir(directoryNameLanguage)
end
