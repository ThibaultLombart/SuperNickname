
# SuperNickname

Garry's mod Addon to change automatically our name when we change our job.

## Installation

To install this addon, you have to download this, go to your directory ```steamapps\common\GarrysMod\garrysmod\addons\```

and drag and drop your ```.zip``` file. Extract here and it's installed.

## Configuration

To configure this addon, you have to go on your server, if you want to change the rpname of a job, just change your job and :

```/supernickname 'nickname'```

This is now permanently change, you can update it with an other ```/supernickname 'nickname'```. If you want to delete one nickname, just go to ```steamapps\common\GarrysMod\garrysmod\data\SuperNickname\jobs_nickname.json``` and change the job you don't want.


## Wiki 
### /supernickname
To get Firstname : ```{firstname}```

To get Name : ```{name}```

To get random number between 1 and 9 : ```r0{1}```

To get random number between 1 and 99 : ```r0{2}```

To get random number between 1 and 999 : ```r0{3}```

To get random number between 1 and 9999 : ```r0{4}```

To get random number between 1 and 99999 : ```r0{5}```

To change your informations in game : ```dev console```(F10) and write : ```change_name```

### Languages
To change the addon language, you have to go to ```steamapps\common\GarrysMod\garrysmod\data\SuperNickname\languages\```.

To change your current_language, just go in the file ```current_language.json``` and change 'en' by 'fr' or any language you add to the file 'languages'

To add your language, you have to copy/paste an existing language file, edit with your language and rename the file by 'ru.json' if you are russian for example, after you have to change 'en' by 'ru' in the file 'current_file.json'.

## Examples 

Mayor :
/supernickname Mayor {name}

Class D :
/supernickname Class-D r0{4}

Doctor :
/supernickname Dr. {name}

Citizen :
/supernickname {firstname} {name}

## Future Updates

- -- Admin -- Force Change Firstname and Name of a player.
- -- Admin -- Configurations files for Languages.
