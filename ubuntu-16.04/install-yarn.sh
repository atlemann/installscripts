#!/bin/bash

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# github.com/yarnpkg/yarn/issues/2821
sudo apt remove cmdtest

sudo apt-get update && sudo apt-get install yarn