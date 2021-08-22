#!/usr/bin/fish
function setuptmux
    if ! type -q tmux
        echo "Installing tmux"
        sudo apt install tmux
    else
        echo "tmux is already installed"
    end
end

function setupomf
    function installselected
        # TODO: Disgusting, fix this.
        set choice (omf theme | string escape --style=regex | string replace -r '(.+Installed:)(.+)' '$2' | string replace -r '(.+Available:)(.+)' '$2' | string replace -a -r '[\\\]' '' | string replace -a -r "[[:blank:]]+" " " | string escape --style=regex | tr -d '[m' | tr -d '(B' | string split " " | string unescape | sort -u -r | fzf --preview-window=up:5% --preview="cat text.txt")

        echo "Installing $choice"
        omf install $choice
    end

    if ! type -q omf
        echo "Oh-my-fish is not setup"

        if ! type -q curl
            echo "Curl is not installed, aborting omf setup"
            return
        else
            curl -L https://get.oh-my.fish > install    
            fish install --path=~/.local/share/omf --config=~/.config/omf

            installselected
        end
    else
        echo "Oh-my-fish is already installed"

        installselected
    end
end

function setupfzf
    function installfzf
        echo "Installing fzf"
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install
    end

    if ! type -q fzf
        echo "fzf is not setup"
        installfzf
    else
        echo "fzf is already installed"
    end
end

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

setuptmux
setupfzf
setupomf

# Setup fish config/functions
#cp config.fish /home/$USER/.config/fish/
#cp tmuxs.fish /home/$USER/.config/fish/functions/

## Color settings
# "background": "#1B2022"
# "foreground": "#D3D7CF"
# "black": "#2E3436"
# "blue": "#AB6D14"
# "cyan": "#30ACAD"
# "green": "#599E17"
# "purple": "#75507B"
# "red": "#E62727"
# "white": "#D3D7CF"
# "yellow": "#AFD517"

# "brightBlack": "#555753"
# "brightBlue": "#DF8D17"
# "brightCyan": "#3BDFE1"
# "brightGreen": "#74CF1D"
# "brightPurple": "#AD7FA8"
# "brightRed": "#BB2020"
# "brightWhite": "#EEEEEC"
# "brightYellow": "#D2FF20"