#!/usr/bin/fish
if ! type -q wslpath 
    echo "Setting up Linux"
else
    echo "Setting up WSL"
    set WSLPATH (wslpath (wslvar USERPROFILE))
    echo "User profile path:" $WSLPATH
    echo "Setting up Windows Terminal settings"
    # TODO: Uncomment this line when the settings.json file is good
    #cp settings.json $WSLPATH/AppData/Local/Packages/Microsoft.WindowsTerminal*/
end

    
    