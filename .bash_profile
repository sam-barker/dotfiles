#!/usr/bin/env bash

export GOPATH="$HOME/go"
export LIBRARY_DIR="$HOME/libs"

declare -xr vs_code_path="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
declare -xr nvm_dir="$HOME/.nvm"

. "$NVM_DIR/nvm.sh"
. "$NVM_DIR/bash_completion"
. "$HOME/.secrets"
. "$HOME/.aliases"

nvm use default --silent

export PATH="$(brew --prefix openvpn)/sbin:$PATH:$vs_code_path"