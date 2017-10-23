#!/bin/bash
wget https://go.microsoft.com/fwlink/?LinkID=760868 -O vscode.deb
sudo dpkg -i vscode.deb
sudo apt install -f
code --install-extension Ionide.ionide-fsharp
code --install-extension Ionide.ionide-Paket
code --install-extension Ionide.ionide-FAKE
code --install-extension ms-vscode.csharp

