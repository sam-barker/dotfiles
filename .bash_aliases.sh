#!/usr/bin/env bash
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

alias c="code"
alias cl="clear"
alias dc="docker-compose"
alias ex="exit"
alias l='ls'
alias mkdir="mkdir -p"
alias n="npm"
alias ncl="rm -rf node_modules && n i"
alias nr="npm run"
nvm() {
  source $(brew --prefix nvm)/nvm.sh
  nvm use default --silent
  nvm
}
alias g="git"
alias ga="git add"
alias gacm="git add . && git commit -m"
alias gcheck="git add . && git commit -m 'Checkpoint' && git rebase -i HEAD~2 && git push --force"
alias gcl="git clone"
alias gclean="git branch | grep -v 'master' | xargs git branch -D"
alias gcm="git commit -m"
alias gco="git checkout"
alias gd="git diff"
alias gnb="git checkout -b"
alias glog="git log --oneline --decorate --graph"
alias gpl="git pull"
alias gpsh='[[ -z $(git config "branch.$(git symbolic-ref --short HEAD).merge") ]] && git push -u origin $(git symbolic-ref --short HEAD) || git push'
alias gs="git status"
alias gst="git stash"
