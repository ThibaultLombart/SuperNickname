print("SUPERNICKNAME -- LANGUAGES INITIALIZATION")

local function writeFileJSONLanguage(table,path)

    local fileLang = file.Open(path, "w", "DATA")
    if fileLang then
        if table then
            local contenu = util.TableToJSON(table)
            fileLang:Write(contenu)
            fileLang:Close()
        else
            fileLang:Close()
        end
    else
        print('Error when writeFileJSON')
    end
end


local path = "supernickname/languages/"
local pathCurrent = path .. "current_language.json"
local pathEnglish = path .. "en.json"
local pathFrench = path .. "fr.json"

-- Current Language

if not file.Exists(pathCurrent,"DATA") then
    local current = {}
    current["current_language"] = 'en'
    writeFileJSONLanguage(current,pathCurrent)
end


-- English Language

if not file.Exists(pathEnglish,"DATA") then
    local english = {}
    english["Supernickname_firstname_name"] = "Enter your Firstname and Name"
    english["Supernickname_firstname"] = "Your Firstname : "
    english["Supernickname_name"] = "Your Name : "
    english["Supernickname_ok"] = "OK"
    english["Supernickname_error_interface"] = "Error, Name or Firstname empty "
    english["Supernickname_change_name_successful"] = "Name and Firstname updated."
    english["Supernickname_change_name_invalid"] = "Name or firstname invalid, please enter valid informations."
    english["Supernickname_nickname"] = "Nickname : "
    english["Supernickname_forjob"] = "for job : "
    english["Supernickname_write"] = "Please write something. "
    english["Supernickname_superadmin"] = "You must be Superadmin to execute this command. "
    writeFileJSONLanguage(english,pathEnglish)
end




-- French Language

if not file.Exists(pathFrench,"DATA") then
    local french = {}
    french["Supernickname_firstname_name"] = "Entrez votre Prénom et Nom"
    french["Supernickname_firstname"] = "Votre Prénom : "
    french["Supernickname_name"] = "Votre Nom : "
    french["Supernickname_ok"] = "OK"
    french["Supernickname_error_interface"] = "Erreur, Prénom ou Nom vide"
    french["Supernickname_change_name_successful"] = "Nom et prénom mis à jour."
    french["Supernickname_change_name_invalid"] = "Nom ou prénom invalide, veuillez entrer des informations valides."
    french["Supernickname_nickname"] = "Nickname : "
    french["Supernickname_forjob"] = "pour le job : "
    french["Supernickname_write"] = "Veuillez ecrire quelque chose. "
    french["Supernickname_superadmin"] = "Vous devez être superadmin pour executer cette commande. "
    writeFileJSONLanguage(french,pathFrench)
end

function ReadCurrent()
    local fileCurrent = file.Open(pathCurrent, "r", "DATA")

    if fileCurrent then
        local myDataInJson = fileCurrent:Read(fileCurrent:Size())
        fileCurrent:Close()

        if myDataInJson then
            local myData = util.JSONToTable(myDataInJson)
            if myData then
                return myData['current_language']
        end
            return 'en'
        
        else
            print("Impossible to decode JSON")
        end
    else
        print("Impossible to open this file ")
    end
end

function ReadLanguageFile()
    current = ReadCurrent()

    local fileLanguage = file.Open(path .. current .. ".json" , "r", "DATA")
    if fileLanguage then
        local myDataInJson = fileLanguage:Read(fileLanguage:Size())
        fileLanguage:Close()

        if myDataInJson then
            local myData = util.JSONToTable(myDataInJson)
            return myData;
        
        else
            print("Impossible to decode JSON")
        end
    else
        local fileLanguage = file.Open(path .. "en.json" , "r", "DATA")
        local myDataInJson = fileLanguage:Read(fileLanguage:Size())
        fileLanguage:Close()

        if myDataInJson then
            local myData = util.JSONToTable(myDataInJson)
            return myData;
        
        else
            print("Impossible to decode JSON")
        end
    end
end
