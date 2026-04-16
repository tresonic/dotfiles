# ls
if command -v eza >/dev/null 2>&1; then
  alias l='eza -1A --group-directories-first --color=always'
  alias ls='l'
  alias la='l -l --time-style="+%Y-%m-%d %H:%M" --no-permissions --octal-permissions'
  alias tree='l --tree'
else
  alias l='ls -1A --color=auto'
  alias ls='ls -1A --color=auto'
  alias la='ls -lA --time-style="+%Y-%m-%d %H:%M"'
  alias tree='ls -R'
fi

alias ip='ip -color'
alias ipa='ip -color -brief address'
alias e='$EDITOR'
alias n='nvim'
alias h='htop'
alias ze='zellij'
alias trash='send2trash'

alias tv='$EDITOR ~/Sync/shows.txt'
alias cds='cd ~/Sync/master/sem1/'
alias updgr='apt update && apt upgrade && apt autoremove'
alias mpvp='mpv --really-quiet --mute=yes --loop-playlist'
alias mpvp9='mpv --really-quiet --mute=yes --loop-playlist --video-rotate=90'
alias mpvp27='mpv --really-quiet --mute=yes --loop-playlist --video-rotate=270'

alias usbmount='udisksctl mount -b /dev/sda1'
alias usbunmount='udisksctl unmount -b /dev/sda1'
alias usbpoweroff='udisksctl power-off -b /dev/sda1'

# git aliases
alias ga='git add'
alias gap='ga --patch'
alias gb='git branch'
alias gba='gb --all'
alias gc='git commit'
alias gca='gc --amend --no-edit'
alias gce='gc --amend'
alias gco='git checkout'
alias gcl='git clone --recursive'
alias gd='git diff --output-indicator-new=" " --output-indicator-old=" "'
alias gds='gd --staged'
alias gi='git init'
alias gl='git log --graph --all --pretty=format:"%C(magenta)%h %C(white) %an  %ar%C(blue)  %D%n%s%n"'
alias gm='git merge'
alias gn='git checkout -b'  # new branch
alias gp='git push'
alias gr='git reset'
alias gs='git status --short'
alias gu='git pull'

# systemd aliases
# Base
alias sc=systemctl
alias scu='systemctl --user'

# Subcommands
alias scst='sudo systemctl start'
alias scsp='sudo systemctl stop'
alias scrl='sudo systemctl reload'
alias scrt='sudo systemctl restart'
alias sce='sudo systemctl enable'
alias scd='sudo systemctl disable'

alias scs='systemctl status'
alias scsw='systemctl show'
alias sclu='systemctl list-units'
alias scluf='systemctl list-unit-files'
alias sclt='systemctl list-timers'
alias scc='systemctl cat'
alias scie='systemctl is-enabled'

# quick serial port
alias sp='tio $(fd . /dev/serial/by-id/ | head -n 1)'

function ytmp3 () { yt-dlp -f 'ba' -x --audio-format mp3 "$@" -o '%(title)s.%(ext)s'; }
function mkcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

# java run dir
function jrd() {
	javac *.java && java $1 || rm -f *.class
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function c() {
    if command -v code >/dev/null 2>&1; then
        code "$@"
    else
        codium "$@"
    fi
}

function cn() {
    if command -v code >/dev/null 2>&1; then
        code --new-window "$@"
    else
        codium --new-window "$@"
    fi
}

# Function to search and install packages using pacman
pacf() {
	pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S
}

# Function to search and install packages using yay
yayf() {
	yay -Slq | fzf --multi --preview 'yay -Si {1}' | xargs -ro yay -S
}

# Function to search and remove packages using pacman
pacrm() {
	pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns
}
