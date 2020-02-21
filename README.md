# Dotfiles
Necessary installation and dotfiles for development.

# Steps
1. Clone this repo
2. Install Homebrew:
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
3. Select xcode version:
```bash
sudo xcode-select --install
```
4. Update Brew
```bash
brew update
```
5. Install NVM
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
```
6. Install Gems
```bash
sudo gem install colorls && \
sudo gem install cocoapods & \
sudo gem install xcodeproj
```
7. Install oh-my-zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
8. Install nerd fonts
```bash
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git "$HOME/nerd-fonts" && cd "$HOME/nerd-fonts" && ./install.sh
```
9. Change directory back to the dotfiles repo
10. Install programs with
```bash
brew bundle --file='.Brewfile'
```
11. Open the following programs so that the config files get created:
  * Hyper
  * Sublime
  * VSCode
12. Run the bash script to setup all the symlinks for the dotfiles:
```bash
./setup.sh
```
13. Restart your terminal session
14. Configure everything else (firefox, 1password, aws creds, etc)
15. ???
16. Profit
