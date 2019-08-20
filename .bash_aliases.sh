#!/usr/bin/env bash

## APPS
# VSCode
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
alias c="code"

## NAVIGATION
alias l='ls'

## CREATION
alias mkdir="mkdir -p"

## TERMINAL MANAGEMENT
alias cl="clear"
alias ex="exit"

## NPM
alias n="npm"
alias nr="npm run"
alias ncl="rm -rf node_modules && n i"

## NVM
nvm() {
  source $(brew --prefix nvm)/nvm.sh
  nvm use default --silent
  nvm
}

## GIT
alias g="git"
alias ga="git add"
alias gs="git status"
alias gd="git diff"
alias glog="git log --oneline --decorate --graph"
alias gst="git stash"
alias gcm="git commit -m"
alias gpl="git pull"
alias gpsh='[[ -z $(git config "branch.$(git symbolic-ref --short HEAD).merge") ]] && git push -u origin $(git symbolic-ref --short HEAD) || git push'
alias gcl="git clone"
alias gnb="git checkout -b"
alias gco="git checkout"
alias gclean="git branch | grep -v 'master' | xargs git branch -D"
alias gcheck="git add . && git commit -m 'Checkpoint' && git rebase -i HEAD~2 && git push --force"

## Docker
alias dc="docker-compose"
