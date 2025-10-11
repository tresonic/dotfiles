export QT_QPA_PLATFORM=wayland
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

# add scripts dir to path
export PATH="$HOME/dotfiles/scripts:$PATH"

export EDITOR=vim

APP_PATH="$HOME/Applications"
export PATH="$APP_PATH/zig-x86_64-linux-0.15.1:$PATH"
