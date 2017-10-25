#!/bin/bash

read -p "Do you want to set up Fira Code font for VSCode? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    curl -fsSL https://github.com/tonsky/FiraCode/releases/download/1.204/FiraCode_1.204.zip -o firacode.zip
    unzip firacode.zip -d firacode
    mkdir -p /usr/local/share/fonts/firacode
    sudo cp firacode/ttf/*.ttf /usr/local/share/fonts/firacode
    sudo fc-cache -fv

    folder="$HOME/.config/Code/User"
    file="$folder/settings.json"
    if [ -f "$file" ]
    then
        echo "Adding Fira Code to the existing $file."
        sed -i '/{/ a \ \ \ \ "editor.fontLigatures\": true,' $file
        sed -i '/{/ a \ \ \ \ "editor.fontSize\": 14,' $file
        sed -i '/{/ a \ \ \ \ "editor.fontFamily\": \"Fira Code\",' $file
    else
        echo "Creating VSCode settings file $file."
        mkdir -p $folder
    	cat >> $file <<EOF
{
    "editor.fontFamily": "Fira Code",
    "editor.fontSize": 14,
    "editor.fontLigatures": true
}
EOF
    fi
fi
