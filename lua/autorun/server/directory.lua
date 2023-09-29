prefix = "-- SUPERNICKNAME --"

print("-- SUPERNICKNAME -- INITIALIZATION")

local directoryName = "supernickname"
local directoryNameLanguage = directoryName .. "/languages"

if not file.Exists(directoryName,"DATA") then
    file.CreateDir(directoryName)
    file.CreateDir(directoryNameLanguage)
end

if not file.Exists(directoryNameLanguage,"DATA") then
    file.CreateDir(directoryNameLanguage)
end

if not file.Exists(directoryName .. "/jobs_nickname.json","DATA") then
    local fileJobs = file.Open(directoryName .. "/jobs_nickname.json", "w", "DATA")
    fileJobs:Close()
end

function IsSuperAdmin(ply)
    return IsValid(ply) and ply:IsSuperAdmin()
end


local function commandSupernickname(ply, args)
    if IsSuperAdmin(ply) then
        local text = args

        if text and text ~= "" then
            local job = ply:getDarkRPVar('job')
            ply:ChatPrint(Supernickname_nickname .. text .. Supernickname_forjob .. job)
            WriteNickName(job,text)
        else
            ply:ChatPrint(Supernickname_write)
        end
    else
        ply:ChatPrint(Supernickname_superadmin)
    end
end

local function commandForceName(ply, args)
    if IsSuperAdmin(ply) then
        local text = args

        if text and text ~= "" then

            local ply = player.GetBySteamID(text)

            if IsValid(ply) then
                print("Player founded :", ply:GetName())
                ply:ConCommand("change_name")
            else
                print("Player unfounded")
            end
        else
            ply:ChatPrint(Supernickname_write)
        end
    else
        ply:ChatPrint(Supernickname_superadmin)
    end
end

hook.Add('DarkRPFinishedLoading','FinishedLoading',function()
    DarkRP.defineChatCommand("forcename", commandForceName)

    DarkRP.declareChatCommand{
        command = "forcename",
        description = "Force the player to open the Change_Name gui",
        delay = 1.5
    }

    DarkRP.defineChatCommand("supernickname", commandSupernickname)

    DarkRP.declareChatCommand{
        command = "supernickname",
        description = "Create Nickname for jobs",
        delay = 1.5
    }
end)