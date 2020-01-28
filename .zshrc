# ZSH Config
export PROMPT='%F{green}λ '

. "$HOME/.bash_profile"
. /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
. /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/sambarker/code/economist/data-dog-feeder/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/sambarker/code/economist/data-dog-feeder/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/sambarker/code/economist/data-dog-feeder/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/sambarker/code/economist/data-dog-feeder/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/sambarker/code/economist/data-dog-feeder/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/sambarker/code/economist/data-dog-feeder/node_modules/tabtab/.completions/slss.zsh