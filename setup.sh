#!/usr/bin/env bash

function installHomebrew() {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && \
    brew update
}

function brewInstall() {
  brew bundle
}

function installNVM() {
  local nvm_home="$HOME/.nvm"
  if [ ! -d "$nvm_home" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
  fi
}

function createSymlinks() {
  ln -sfn "$(pwd)/.aliases" "$HOME/.aliases"
  ln -sfn "$(pwd)/.bash_profile" "$HOME/.bash_profile"
  ln -sfn "$(pwd)/Brewfile" "$HOME/.Brewfile"
  ln -sfn "$(pwd)/.gitconfig" "$HOME/.gitconfig"
  ln -sfn "$(pwd)/.hushlogin" "$HOME/.hushlogin"
  ln -sfn "$(pwd)/.zshrc" "$HOME/.zshrc"
  ln -sfn "$(pwd)/.hyper.js" "$HOME/.hyper.js"
}

function createSecretsFile() {
  touch "$HOME/.secrets"
}

function main() {
  installHomebrew && \
  installNVM && \
  createSecretsFile && \
  createSymlinks && \
  brewInstall
}

main "$@"
