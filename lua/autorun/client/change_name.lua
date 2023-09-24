include("vgui/dframe.lua")
include("vgui/dbutton.lua")
include("vgui/dlabel.lua")
include("vgui/dtextentry.lua")





-- Gestionnaire de réseau pour ouvrir l'interface utilisateur de changement de nom et prénom
net.Receive("OuvrirInterfaceChangementNomPrenom", function(ply)
    -- Code pour ouvrir l'interface de changement de nom et prénom côté client
    local function OuvrirInterfaceChangementNomPrenom()
        

        local frame = vgui.Create("DFrame")
        frame:SetSize(300, 150)
        frame:SetTitle("Enter your Firstname and Name")
        frame:SetVisible(true)
        frame:Center()
        frame:SetDraggable(false) -- Empêche de déplacer la fenêtre
        frame:ShowCloseButton(false) -- Désactive le bouton de fermeture

        local labelError = vgui.Create("DLabel", frame)
        labelError:SetText("")
        labelError:SetColor(Color(255, 0, 0))
        labelError:SetPos(100, 30)


        local labelPrenom = vgui.Create("DLabel", frame)
        labelPrenom:SetText("Firstname:")
        labelPrenom:SetPos(20, 50)

        local txtPrenom = vgui.Create("DTextEntry", frame)
        txtPrenom:SetSize(150, 20)
        txtPrenom:SetPos(80, 50)

        local labelNom = vgui.Create("DLabel", frame)
        labelNom:SetText("Name:")
        labelNom:SetPos(20, 80)

        local txtNom = vgui.Create("DTextEntry", frame)
        txtNom:SetSize(150, 20)
        txtNom:SetPos(80, 80)

        local btnOK = vgui.Create("DButton", frame)
        btnOK:SetText("OK")
        btnOK:SetSize(50, 30)
        btnOK:SetPos(125, 110)

        frame.OnKeyCodePressed = function(self, key)
            if key == KEY_ENTER or key == KEY_PAD_ENTER then
                btnOK:DoClick()
            end
        end

        -- Action à effectuer lorsque le bouton OK est cliqué
        btnOK.DoClick = function()
            local newName = txtNom:GetValue()
            local newFirstName = txtPrenom:GetValue()
            if newName and newName ~= "" and newFirstName and newFirstName ~= "" then
                net.Start("OuvrirInterfaceChangementNomPrenom")
                net.WriteString(newName)
                net.WriteString(newFirstName)
                net.SendToServer()
                -- Insérez ici le code pour traiter le nom et le prénom
                
                frame:Close() -- Ferme la fenêtre après avoir traité les données
            else
                labelError:SetText("Error, Firstname or Name empty")
            end
        end


        frame:MakePopup()
    end

    -- Appelez la fonction pour ouvrir l'interface utilisateur
    OuvrirInterfaceChangementNomPrenom()
end)



