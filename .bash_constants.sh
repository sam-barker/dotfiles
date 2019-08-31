#!/usr/bin/env bash

# Export into session as read only variable
# NVM Config
export NVM_DIR="$HOME/.nvm"

# ZSH Config
export ZSH="$HOME/libs/.oh-my-zsh"
export ZSH_THEME="powerlevel9k/powerlevel9k"
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time dir node_version vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

# ZSH Powerlevel prompt colours
export POWERLEVEL9K_TIME_FOREGROUND='000'
export POWERLEVEL9K_TIME_BACKGROUND='028'
export POWERLEVEL9K_DIR_HOME_FOREGROUND='000'
export POWERLEVEL9K_DIR_HOME_BACKGROUND='029'
export POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='000'
export POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='029'
export POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='red'
export POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='blue'
export POWERLEVEL9K_NODE_VERSION_BACKGROUND='030'
export POWERLEVEL9K_NODE_VERSION_FOREGROUND='000'

# Secrets
export SECRETS_DIR="$HOME/.secrets"

# Libs
export LIBRARY_DIR="$HOME/libs"

