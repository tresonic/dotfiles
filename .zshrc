source $HOME/.aliases

# add scripts dir to path
export PATH="$HOME/dotfiles/scripts:$PATH"

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
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

unsetopt beep
bindkey -e
autoload -Uz compinit promptinit bashcompinit
compinit
promptinit
bashcompinit
zstyle :compinstall filename '$HOME/.zshrc'
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

setopt PROMPT_SUBST
PROMPT='%F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '
RPROMPT='%F{green}%*%f'

### Build vcs_info_msg
# Autoload zsh's `add-zsh-hook` and `vcs_info` functions
# (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info

# Set prompt substitution so we can use the vcs_info_message variable
setopt prompt_subst

# Run the `vcs_info` hook to grab git info before displaying the prompt
add-zsh-hook precmd vcs_info

# Style the vcs_info message
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats '%b%u%c %a'
# Format when the repo is in an action (merge, rebase, etc)
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'
zstyle ':vcs_info:git*' unstagedstr '*'
zstyle ':vcs_info:git*' stagedstr '+'
# This enables %u and %c (unstaged/staged changes) to work,
# but can be slow on large repos
zstyle ':vcs_info:*:*' check-for-changes true

# zoxide
eval "$(zoxide init zsh)"

export EDITOR=vim

APP_PATH="$HOME/Applications"
export PATH="$APP_PATH/zig-x86_64-linux-0.14.1:$PATH"
export PATH="$APP_PATH/zls-linux-x86_64-0.14.0:$PATH"

# ssh agent connection
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket
# use keychain if available
if command -v keychain &> /dev/null; then
    eval "$(keychain --eval id_ed25519)"
fi
