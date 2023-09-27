util.AddNetworkString("OuvrirInterfaceChangementNomPrenom")

-- Create command to open interface
concommand.Add("change_name", function(ply)
    net.Start("OuvrirInterfaceChangementNomPrenom")
    net.Send(ply)
end)

-- Create net to manage connection between client and server
net.Receive("OuvrirInterfaceChangementNomPrenom", function(len, ply)
    local newName = net.ReadString() -- read new Name
    local newFirstName = net.ReadString() -- read new Firstname

    if newName and newName ~= "" and newFirstName and newFirstName ~= "" then

        local value = ReadNickName(ply:getDarkRPVar('job'))
        
        ChangeName(ply,value,newName,newFirstName)

        ply:ChatPrint(Supernickname_change_name_successful)
    else
        ply:ChatPrint(Supernickname_change_name_invalid)
    end
end)