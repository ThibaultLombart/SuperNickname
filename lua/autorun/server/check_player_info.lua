

hook.Add("PlayerAuthed", "CheckPlayerInfo", function(ply, steamid, uniqueid)

    local playerName = ply:GetUPData("name");
    if not playerName then
        ply:ConCommand("change_name")
    end
end)