#!/usr/bin/env bash

CODE_DIR="$(pwd)"
LIBRARY_DIR="$HOME/libs"
SECRETS_FILE_PATH="$HOME/.bash_secrets.sh"
SYMLINK_FILES=( ".bash_aliases.sh" ".bash_constants.sh" ".bash_profile" ".gitconfig" ".hushlogin" ".zshrc" ".vimrc" ".vim")
OS="$OSTYPE"

update() {
  if [[ "$OS" == "linux-gpu"]]; then
    sudo apt-get -y update
    sudo apt-get -y install git
  else
    echo "Update not needed as this is not a Linux system"
  fi  
}

installVim() {
  # Vim needs installing on linux devices
  if [[ "$OS" == "linux-gpu"]]; then
    sudo apt-get -y install vim
  else
    echo "Vim does not need installing"
  fi
}

installBrew() {
  if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "This is not an MacOS system, so brew cannot be installed"
  elif ! BREW_LOC="$(type -p brew)" || [ -z "$BREW_LOC" ]; then
    # Install Homebrew if not already installed
    echo " => Installing Homebrew ..." &&
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &&
    echo "Homebrew installed! 👍" &&
    # Force a brew update
    echo " => Updating Homebrew ..." &&
    brew update &&
    echo "Homebrew updated!"
  else
    echo "Homebrew already installed! 👍"
  fi
}

installVSCode() {
  if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "This is not an MacOS system, so VSCode cannot be installed from the command line"
  elif ! CODE_LOC="$(type code)" || [ -z "$CODE_LOC" ]; then
    echo " => Installing VScode ..." &&
    brew cask install visual-studio-code &&
    echo "VScode installed! 👍"
  else
    echo "VSCode already installed! 👍"
  fi
}

installFF() {
  # Firefox comes pre-installed on Ubuntu
  if [[ "$OSTYPE" == "linux-gpu" ]]; then
    echo "Linux already has Firefox pre-installed!"
    return 0
  fi
  
  local FF_LOC="/Applications/Firefox.app"
  if [ ! -d "$FF_LOC" ]; then
    echo " => Installing Firefox ..." &&
    brew cask install firefox &&
    echo "Firefox installed! 👍"
  else
    echo "Firefox already installed! 👍"
  fi
}

installZSH() {
  if [[ "$OSTYPE" == "linux-gpu" ]]; then
    sudo apt-get -y install zsh
    chsh -s $(which zsh)
  elif ! ZSH_LOC="$(type zsh)" || [ -z "$ZSH_LOC" ]; then
    echo " => Installing zsh and setting to default shell ..." &&
    brew install zsh && chsh -s `which zsh` &&
    echo "Zsh installed! 👍"
  else
    echo "Zsh already installed! 👍"
  fi

  # oh-my-zsh
  local ZSH="$LIBRARY_DIR/.oh-my-zsh"
  local PREV_LOC=$(pwd) &&

  if [ ! -d "$ZSH" ]; then
    echo " => Making $ZSH directory" &&
    mkdir $LIBRARY_DIR &&
    cd $LIBRARY_DIR &&
    echo " => Installing oh-my-zsh ..." &&
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended &&
    git clone https://github.com/bhilburn/powerlevel9k.git "$ZSH/themes/powerlevel9k" &&
    echo "oh-my-zsh installed! 👍" &&
    cd $PREV_LOC
  else
    echo "oh-my-zsh already installed! 👍"
  fi

  if [ ! -d "$LIBRARY_DIR/.oh-my-zsh/zsh-syntax-highlighting" ]; then
    echo " => Installing zsh-syntax-highlighting ..." &&
    cd "$LIBRARY_DIR/.oh-my-zsh" &&
    git clone git://github.com/zsh-users/zsh-syntax-highlighting.git &&
    echo "zsh-syntax-highlighting installed! 👍"
  else
    echo "zsh-syntax-highlighting already installed! 👍"
  fi
}

createSymlinks() {
  echo "Creating symlinks" && \
    cd $HOME

  for i in "${SYMLINK_FILES[@]}"
  do
    ln -sf "$CODE_DIR/$i" .
  done

  echo "Symlinks created!"
}

createSecretsFile() {
  echo " => Creating Secrets file ..." && \
    touch "$SECRETS_FILE_PATH"
}

echo "Running setup script ..." && \
  update && \
  installVim && \
  installBrew && \
  installVSCode && \
  installChrome && \
  installFF && \
  installZSH && \
  createSymlinks && \
  createSecretsFile && \
  cd $CODE_DIR && \
  echo "Setup script complete! Please reload terminal session."
