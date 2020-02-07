#!/bin/bash

sudo apt-get -y install curl

# dotnet core sdk
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

# VSCode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Mono
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list

sudo apt-get -y install apt-transport-https
sudo apt-get update
sudo apt-get -y install fsharp dotnet-sdk-3.1 code fonts-firacode

code --install-extension Ionide.ionide-fsharp
code --install-extension Ionide.ionide-Paket
code --install-extension Ionide.ionide-FAKE
code --install-extension ms-vscode.csharp

folder="$HOME/.config/Code/User"
file="$folder/settings.json"

echo "Creating VSCode settings file $file."

mkdir -p $folder
cat >> $file <<EOF
{
    "editor.fontLigatures": true,
    "editor.fontFamily": "Fira Code",
    "editor.fontSize": 14,
    "FSharp.fsacRuntime": "netcore"
}
EOF

./setup-git.sh
