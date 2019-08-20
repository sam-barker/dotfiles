# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
declare CURRENT_PATH="$(pwd)"

# Source in our constants
. "$CURRENT_PATH/.bash_constants.sh"
. "$CURRENT_PATH/.bash_aliases.sh"
. "$CURRENT_PATH/.bash_profile"

# Source in ZSH scripts
. "$ZSH/oh-my-zsh.sh"
. "$ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
