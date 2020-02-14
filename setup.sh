#!/usr/bin/env bash
declare -xr SUBLIME_HOME="$HOME/Library/Application Support/Sublime Text 3"

function install {
  local nvm_home="$HOME/.nvm"

  # Brew, and xcode
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && \
  sudo xcode-select --install && \
  brew update && \
  brew bundle --file="$HOME/Brewfile"

  if [ ! -d "$nvm_home" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
  fi

  # Tools
  curl -o \
    "$SUBLIME_HOME/Installed Packages/Package Control.sublime-package" \
    https://packagecontrol.io/Package%20Control.sublime-package && \
  sudo gem install colorls && \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # Fonts
  git clone https://github.com/ryanoasis/nerd-fonts.git "$HOME" && \
  ./$HOME/nerd-fonts/install.sh
}

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
}

function create_secrets_file {
  touch "$HOME/.secrets"
}

function main() {
  if [ "$1" == '--symlinks-only' ]; then
    create_symlinks
  elif [ "$1" == '--install-only' ]; then
    install
  else
    install && \
    create_symlinks &&
    create_secrets_file
  fi
}

main "$@"
