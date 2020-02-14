#!/usr/bin/env bash

export GOPATH="$HOME/go"
export LIBRARY_DIR="$HOME/libs"

declare -r vs_code_path="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
declare -r nvm_dir="$HOME/.nvm"

. "$nvm_dir/nvm.sh"
. "$nvm_dir/bash_completion"
. "$HOME/.secrets"
. "$HOME/.aliases"
. $(dirname $(gem which colorls))/tab_complete.sh
. $(brew --prefix)/etc/profile.d/z.sh

export RBENV_ROOT=/usr/local/var/rbenv
export PATH="$(brew --prefix openvpn)/sbin:$PATH:$vs_code_path"

eval "$(rbenv init -)"
