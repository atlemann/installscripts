#!/bin/bash
# Credits: https://haacked.com/archive/2014/07/28/github-flow-aliases/
git config --global alias.co checkout
git config --global alias.cob "checkout -b"
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.bra "branch -a"
git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
git config --global alias.up "up = !git pull --rebase --prune $@ && git submodule update --init --recursive"
git config --global alias.ec "config --global -e"
