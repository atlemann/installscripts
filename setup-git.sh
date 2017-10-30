#!/bin/bash
# Git aliases. https://haacked.com/archive/2014/07/28/github-flow-aliases/
git config --global alias.co checkout
git config --global alias.cob "checkout -b"
git config --global alias.ci commit
git config --global alias.cm '!git add -A && git commit -m'
git config --global alias.st status
git config --global alias.br branch
git config --global alias.bra "branch -a"
git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
git config --global alias.up '!git pull --rebase --prune $@ && git submodule update --init --recursive'
git config --global alias.ec "config --global -e"

# Git branch info in terminal prompt
curl -fsSL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh

cat >> ~/.bashrc <<EOF
# Git branch info in terminal prompt
. ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=true
export PROMPT_COMMAND='__git_ps1 "\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]" "\\\$ "'
EOF
