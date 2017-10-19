echo "Running setup script ...\n"
directory=$(pwd)

# Install Homebrew if not already Installed
if ! brew_location="$(type -p brew)" || [ -z "$brew_location" ]; then
  echo "Installing Homebrew ...\n" &&
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &&
  echo "Homebrew installed! 👍\n"
else
  echo "Homebrew already installed! 👍\n"
fi

# Force a brew update
echo "Updating Homebrew ...\n" &&
brew update &&
echo "Homebrew updated!\n"

# zsh
if ! zsh_location="$(type -p zsh)" || [ -z "$zsh_location" ]; then
  echo "Installing zsh and setting to default shell ...\n" &&
  brew install zsh && chsh -s `which zsh` &&
  echo "Zsh installed! 👍\n"
else
  echo "Zsh already installed! 👍\n"
fi

# oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
  echo "Installing oh-my-zsh ...\n" &&
  curl -L http://install.ohmyz.sh | sh &&
  echo "oh-my-zsh installed! 👍\n"
else
  echo "oh-my-zsh already installed! 👍\n"
fi

if [ ! -d ~/.oh-my-zsh/zsh-syntax-highlighting ]; then
  echo "Installing zsh-syntax-highlighting ...\n" &&
  cd ~/.oh-my-zsh &&
  git clone git://github.com/zsh-users/zsh-syntax-highlighting.git &&
  echo "zsh-syntax-highlighting installed! 👍\n"
else
  echo "zsh-syntax-highlighting already installed! 👍\n"
fi

# zsh
if ! z_location="$(type -p z)" || [ -z "$z_location" ]; then
  echo "Installing z ...\n" &&
  cd ~ && touch .z &&
  brew install z &&
  echo "z installed! 👍\n"
else
  echo "z already installed! 👍\n"
fi

echo "Creating symlinks ...\n"
cd ~ &&
ln -s "$directory/.aliases" . &&
ln -s "$directory/.hushlogin" . &&
ln -s "$directory/.zshrc" . &&
source ~/.zshrc
echo "Symlinks created!\n"

echo "Setup script complete!"
