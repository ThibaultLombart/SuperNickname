local function IsSuperAdmin(ply)
    return IsValid(ply) and ply:IsSuperAdmin()
end


local function commandSupernickname(ply, args)
    if IsSuperAdmin(ply) then
        local text = args

        if text and text ~= "" then
            local job = ply:getDarkRPVar('job')
            ply:ChatPrint("Nickname : " .. text .. " for job : " .. job)
            WriteNickName(job,text)
        else
            ply:ChatPrint("Please write something.")
        end
    else
        ply:ChatPrint("You must be Superadmin to execute this command.")
    end
end

hook.Add('DarkRPFinishedLoading','FinishedLoading',function()

DarkRP.defineChatCommand("supernickname", commandSupernickname)

DarkRP.declareChatCommand{
    command = "supernickname",
    description = "Create Nickname for jobs",
    delay = 1.5
}

end)