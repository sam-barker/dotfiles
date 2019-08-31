#!/usr/bin/env bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
fi

alias vim="nvim"
alias v="vim"
alias c="code"
clonerepos() {
 curl "https://api.github.com/users/sam-barker/repos?per_page=1000" | grep -o 'git@[^"]*' | xargs -L1 git clone
}
alias cl="clear"
alias dc="docker-compose"
alias ex="exit"
alias l='ls'
alias mkdir="mkdir -p"
alias n="npm"
alias ncl="rm -rf node_modules && n i"
alias nr="npm run"
nvm() {
  source "$NVM_HOME/nvm.sh"
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
gpsh() {
  [[ -z $(git config "branch.$(git symbolic-ref --short HEAD).merge") ]] && git push -u origin $(git symbolic-ref --short HEAD) || git push
}
alias gs="git status"
alias gst="git stash"
alias json="python -m json.tool"
