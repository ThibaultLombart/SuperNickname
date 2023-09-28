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

end)