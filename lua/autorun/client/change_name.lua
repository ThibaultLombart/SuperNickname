include("vgui/dframe.lua")
include("vgui/dbutton.lua")
include("vgui/dlabel.lua")
include("vgui/dtextentry.lua")

function TranslateInfoReceived(callback)
    net.Start("TranslateInfo")
    net.WriteString('Translate')
    net.SendToServer()

    net.Receive("TranslateInfo", function(len)
        local serverAnswer = net.ReadTable()
        if callback then
            callback(serverAnswer)
        end
    end)
end


net.Receive("OuvrirInterfaceChangementNomPrenom", function(ply)
    TranslateInfoReceived(function(serverAnswer)
        local function OuvrirInterfaceChangementNomPrenom()
            
            local frame = vgui.Create("DFrame")
            frame:SetSize(300, 150)
            frame:SetTitle(serverAnswer[0])
            frame:SetVisible(true)
            frame:Center()
            frame:SetDraggable(false)
            frame:ShowCloseButton(false)

            local labelError = vgui.Create("DLabel", frame)
            labelError:SetText("")
            labelError:SetColor(Color(255, 0, 0))
            labelError:SetPos(80, 30)
            labelError:SetSize(200,20)


            local labelPrenom = vgui.Create("DLabel", frame)
            labelPrenom:SetText(serverAnswer[1])
            labelPrenom:SetPos(20, 50)
            labelPrenom:SetSize(100,20)

            local txtPrenom = vgui.Create("DTextEntry", frame)
            txtPrenom:SetSize(150, 20)
            txtPrenom:SetPos(120, 50)

            local labelNom = vgui.Create("DLabel", frame)
            labelNom:SetText(serverAnswer[2])
            labelNom:SetPos(20, 80)
            labelNom:SetSize(120,20)

            local txtNom = vgui.Create("DTextEntry", frame)
            txtNom:SetSize(150, 20)
            txtNom:SetPos(120, 80)

            local btnOK = vgui.Create("DButton", frame)
            btnOK:SetText(serverAnswer[3])
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
                    labelError:SetText(serverAnswer[4])
                end
            end


            frame:MakePopup()
        end

        OuvrirInterfaceChangementNomPrenom()
    end)
end)



