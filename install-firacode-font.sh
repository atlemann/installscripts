#!/bin/bash

curl -fsSL https://github.com/tonsky/FiraCode/releases/download/1.204/FiraCode_1.204.zip -o firacode.zip
unzip firacode.zip -d firacode
mkdir -p /usr/local/share/fonts/firacode
sudo cp firacode/ttf/*.ttf /usr/local/share/fonts/firacode
sudo fc-cache -fv
