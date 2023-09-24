util.AddNetworkString("OuvrirInterfaceChangementNomPrenom")

-- Create command to open interface
concommand.Add("change_name", function(ply)
    net.Start("OuvrirInterfaceChangementNomPrenom")
    net.Send(ply)
end)

-- Create net to manage connection between client and server
net.Receive("OuvrirInterfaceChangementNomPrenom", function(len, ply)
    local newName = net.ReadString() -- read new Name
    local newLastName = net.ReadString() -- read new Firstname

    if newName and newName ~= "" and newLastName and newLastName ~= "" then
        -- Update names in UPData
        ply:SetUPData("name", newName)
        ply:SetUPData("firstname", newLastName)
        -- Define new RPName
        ply:setRPName(newLastName .. " " .. newName)

        -- Change name for all players
        ply:SetNWString("rpname", newLastName .. " " .. newName)

        ply:ChatPrint("Name and Firstname updated.")
    else
        ply:ChatPrint("Name or firstname invalid, please enter valid informations.")
    end
end)