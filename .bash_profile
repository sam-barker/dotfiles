#!/usr/bin/env bash

export GOPATH="$HOME/go"
export LIBRARY_DIR="$HOME/libs"

export VS_CODE_PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export NVM_DIR="$HOME/.nvm"

. "$NVM_DIR/nvm.sh"
. "$HOME/.secrets"
. "$HOME/.aliases"
. $(dirname $(gem which colorls))/tab_complete.sh
. $(brew --prefix)/etc/profile.d/z.sh

export RBENV_ROOT=/usr/local/var/rbenv
export PATH="$(brew --prefix openvpn)/sbin:$PATH:$VS_CODE_PATH"
eval "$(rbenv init -)"
