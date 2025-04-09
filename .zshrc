#  _____    _
# |__  /___| |__  _ __ ___
#   / // __| '_ \| '__/ __|
#  / /_\__ \ | | | | | (__
# /____|___/_| |_|_|  \___|
# Aliases for a few useful commands
#
ZSH_THEME='robbyrussell'

source $HOME/.aliases

setopt COMPLETE_ALIASES
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt appendhistory
setopt autocd
setopt extendedglob
setopt incappendhistory
setopt nomatch
setopt notify
setopt sharehistory

unsetopt beep
bindkey -e
autoload -Uz compinit promptinit bashcompinit
compinit
promptinit
bashcompinit
zstyle :compinstall filename '$HOME/.zshrc'


plugins=(
    colorize
    git
    history-substring-search
    safe-paste
    virtualenv
)

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
