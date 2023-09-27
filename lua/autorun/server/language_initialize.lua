
hook.Add("Initialize", "Initialize GMOD", function()
    print('-- SUPERNICKNAME -- IMPORT LANGUAGES')
    local myData = ReadLanguageFile()
    Supernickname_firstname_name = myData["Supernickname_firstname_name"]
    Supernickname_firstname = myData["Supernickname_firstname"]
    Supernickname_name = myData["Supernickname_name"]
    Supernickname_ok = myData["Supernickname_ok"]
    Supernickname_error_interface = myData["Supernickname_error_interface"]
    Supernickname_change_name_successful = myData["Supernickname_change_name_successful"]
    Supernickname_change_name_invalid = myData["Supernickname_change_name_invalid"]
    Supernickname_nickname = myData["Supernickname_nickname"]
    Supernickname_forjob = myData["Supernickname_forjob"]
    Supernickname_write = myData["Supernickname_write"]
    Supernickname_superadmin = myData["Supernickname_superadmin"]

    util.AddNetworkString("TranslateInfo")

    net.Receive("TranslateInfo", function(len, ply)

        local clientMessage = net.ReadString()

        local serverAnswer = {}
        serverAnswer[0] = Supernickname_firstname_name
        serverAnswer[1] = Supernickname_firstname
        serverAnswer[2] = Supernickname_name
        serverAnswer[3] = Supernickname_ok
        serverAnswer[4] = Supernickname_error_interface


        net.Start("TranslateInfo")
        net.WriteTable(serverAnswer)
        net.Send(ply)
    end)
end)

