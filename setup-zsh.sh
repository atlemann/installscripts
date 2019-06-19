#!/bin/bash

# Run this from the home directory

# Install zsh and required fonts
sudo apt-get update
sudo apt install zsh powerline fonts-powerline

# Install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Get the solarized dark theme and add it to the config file
curl https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark --output ~/.dircolors
echo "eval `dircolors ~/.dircolors`" >> .zshrc

# Add some plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sed -i 's/plugins=(git)/plugins=(git z zsh-syntax-highlighting zsh-autosuggestions)/g' .zshrc

# Set ZSH as the default terminal
chsh -s $(which zsh)
