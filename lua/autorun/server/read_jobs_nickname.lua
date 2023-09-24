json = require "json"

function ReadNickName(keySearched)
    local path = "supernickname/jobs_nickname.json"

    local fileJobs = file.Open(path, "r", "DATA")

    if fileJobs then
        local myDataInJson = fileJobs:Read(fileJobs:Size())
        fileJobs:Close()

        if myDataInJson then
            local myData = util.JSONToTable(myDataInJson)
            if myData then

                return myData[keySearched]
        end
            return nil
        
        else
            print("Impossible to decode JSON")
        end
    else
        print("Impossible to open this file ")
    end
end