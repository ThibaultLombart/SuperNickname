

hook.Add("PlayerAuthed", "CheckPlayerInfo", function(ply, steamid, uniqueid)

    local playerName = ply:GetUPData("name");
    if not playerName then
        ply:ConCommand("change_name")
    else
        local newName = ply:GetUPData("name")
        local newFirstName = ply:GetUPData("firstname")
        local value = ReadNickName(ply:getDarkRPVar('job'))
        
        ChangeName(ply,value,newName,newFirstName)
    end
end)