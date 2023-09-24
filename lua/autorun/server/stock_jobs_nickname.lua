json = require("json")

local path = "supernickname/jobs_nickname.json"
local function readFileJSON()

    local fileJobs = file.Open(path, "r", "DATA")

    if fileJobs then
        local contenu = fileJobs:Read(fileJobs:Size())
        fileJobs:Close()
        local result = {}
        if contenu then
            local result = util.JSONToTable(contenu)
            return result
        end
        return result
    else
        print('Return Null when readFileJSON')
        return nil
    end

end

local function writeFileJSON(table)

    local fileJobs = file.Open(path, "w", "DATA")
    if fileJobs then
        if table then
            local contenu = util.TableToJSON(table)
            fileJobs:Write(contenu)
            fileJobs:Close()
        else
            fileJobs:Close()
        end
    else
        print('Error when writeFileJSON')
    end
end



function WriteNickName(keys,value)
    local table = readFileJSON()
    if table then

        table[keys] = value
        writeFileJSON(table)
    else
        print("Error when WriteNickName")
    end
end