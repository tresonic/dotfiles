#  _____    _
# |__  /___| |__  _ __ ___
#   / // __| '_ \| '__/ __|
#  / /_\__ \ | | | | | (__
# /____|___/_| |_|_|  \___|
# Aliases for a few useful commands
#
ZSH_THEME='robbyrussell'

alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias ip='ip -c'
alias rm='rm -i'
alias h='htop'
alias z='zellij'

alias cds='cd ~/Sync/stud/sem6/'
alias updgr='apt update && apt upgrade && apt autoremove'
alias mpvp='mpv --really-quiet --mute=yes --loop-playlist'

alias mirrorUpdate='reflector --country us --latest 15 --protocol https --sort rate --save /etc/pacman.d/mirrorlist --verbose'
alias pacs='pacman -Ss'
alias paci='sudo pacman -S'

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


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
