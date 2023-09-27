function CheckDuplicateRPNames(rpNameSearched)
    local players = player.GetAll()
    
    for _, ply in pairs(players) do
        local rpName = ply:getDarkRPVar("rpname")
        if rpName then
            if rpName == rpNameSearched then
                return true
            end
        end
    end

    return false
end

function ChangeName(ply,value,name,firstName)
    if value then
        local result = value:gsub("{name}", name)
        result = result:gsub("{firstname}", firstName)

        math.randomseed(os.time())

        if string.find(value, "r0{1}") then
            local compteur = 0
            repeat
                local nombreAleatoire = math.random(1, 9)
                test = result:gsub("r0{1}", nombreAleatoire)
                compteur = compteur + 1
                if not CheckDuplicateRPNames(test) then
                    break
                end
            until compteur < 20
            if compteur == 20 then
                print(prefix .. 'Too much iterations during random naming.')
            else
                result = test
            end

        elseif string.find(value, "r0{2}") then
            local compteur = 0
            repeat
                local nombreAleatoire = math.random(1, 99)
                test = result:gsub("r0{2}", nombreAleatoire)
                compteur = compteur + 1
                if not CheckDuplicateRPNames(test) then
                    break
                end
            until compteur < 100
            if compteur == 100 then
                print(prefix .. 'Too much iterations during random naming.')
            else
                result = test
            end
            
        elseif string.find(value, "r0{3}") then
            local compteur = 0
            repeat
                local nombreAleatoire = math.random(1, 999)
                test = result:gsub("r0{3}", nombreAleatoire)
                compteur = compteur + 1
                if not CheckDuplicateRPNames(test) then
                    break
                end
            until compteur < 100
            if compteur == 100 then
                print(prefix .. 'Too much iterations during random naming.')
            else
                result = test
            end
            
        elseif string.find(value, "r0{4}") then
            local compteur = 0
            repeat
                local nombreAleatoire = math.random(1, 9999)
                test = result:gsub("r0{4}", nombreAleatoire)
                compteur = compteur + 1
                if not CheckDuplicateRPNames(test) then
                    break
                end
            until compteur < 100
            if compteur == 100 then
                print(prefix .. 'Too much iterations during random naming.')
            else
                result = test
            end
            
        elseif string.find(value, "r0{5}") then
            local compteur = 0
            repeat
                local nombreAleatoire = math.random(1, 99999)
                test = result:gsub("r0{5}", nombreAleatoire)
                compteur = compteur + 1
                if not CheckDuplicateRPNames(test) then
                    break
                end
            until compteur < 100
            if compteur == 100 then
                print(prefix .. 'Too much iterations during random naming.')
            else
                result = test
            end
        end

            
        if(ply:getDarkRPVar('rpname') ~= result) then
            ply:setRPName(result)
            ply:SetNWString("rpname", result)
        end
    else
        if(ply:getDarkRPVar('rpname') ~= (firstName .. " " .. name)) then
            ply:setRPName(firstName .. " " .. name)
            ply:SetNWString("rpname", firstName .. " " .. name)
        end
    end
end




hook.Add("OnPlayerChangedTeam","ChangedTeamInfo",function(ply, before, after)
    local value = ReadNickName(ply:getDarkRPVar('job'))
    local name = ply:GetUPData("name")
    local firstName = ply:GetUPData("firstname")
    
    ChangeName(ply,value,name,firstName)


end)