include("vgui/dframe.lua")
include("vgui/dbutton.lua")
include("vgui/dlabel.lua")
include("vgui/dtextentry.lua")


net.Receive("OuvrirInterfaceChangementNomPrenom", function(ply)
    local function OuvrirInterfaceChangementNomPrenom()
        

        local frame = vgui.Create("DFrame")
        frame:SetSize(300, 150)
        frame:SetTitle("Enter your Firstname and Name")
        frame:SetVisible(true)
        frame:Center()
        frame:SetDraggable(false)
        frame:ShowCloseButton(false)

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

        -- If ok is clicked
        btnOK.DoClick = function()
            local newName = txtNom:GetValue()
            local newFirstName = txtPrenom:GetValue()
            if newName and newName ~= "" and newFirstName and newFirstName ~= "" then
                net.Start("OuvrirInterfaceChangementNomPrenom")
                net.WriteString(newName)
                net.WriteString(newFirstName)
                net.SendToServer()
                
                frame:Close()
            else
                labelError:SetText("Error, Firstname or Name empty")
            end
        end


        frame:MakePopup()
    end

    OuvrirInterfaceChangementNomPrenom()
end)



