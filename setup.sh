#!/usr/bin/env bash
declare -r SUBLIME_HOME="$HOME/Library/Application Support/Sublime Text 3"
declare -r VSCODE_HOME="$HOME/Library/Application Support/Code"

function create_symlinks {
  ln -sfn "$(pwd)/.aliases" "$HOME/.aliases"
  ln -sfn "$(pwd)/.bash_profile" "$HOME/.bash_profile"
  ln -sfn "$(pwd)/.Brewfile" "$HOME/Brewfile"
  ln -sfn "$(pwd)/.gitconfig" "$HOME/.gitconfig"
  ln -sfn "$(pwd)/.hushlogin" "$HOME/.hushlogin"
  ln -sfn "$(pwd)/.zshrc" "$HOME/.zshrc"
  ln -sfn "$(pwd)/.hyper.js" "$HOME/.hyper.js"
  ln -sfn "$(pwd)/Preferences.sublime-settings" "$SUBLIME_HOME/Packages/User/Preferences.sublime-settings"
  ln -sfn "$(pwd)/Package Control.sublime-settings" "$SUBLIME_HOME/Packages/User/Package Control.sublime-settings"
  ln -sfn "$(pwd)/vscodesettings.json" "$VSCODE_HOME/User/settings.json"
  ln -sfn "$(pwd)/vscodekeybindings.json" "$VSCODE_HOME/User/keybindings.json"
}

function create_secrets_file {
  touch "$HOME/.secrets"
}

function main() {
  if [ "$1" == '--symlinks-only' ]; then
    create_symlinks
  else
    create_secrets_file && create_symlinks
  fi
}

main "$@"
