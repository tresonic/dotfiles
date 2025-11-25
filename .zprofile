# dark themes and wayland
export QT_QPA_PLATFORM=wayland
export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-Dark

# add scripts dir to path
export PATH="$HOME/dotfiles/scripts:$PATH"
# uv
export PATH="/home/luis/.local/bin:$PATH"
# apps
APP_PATH="$HOME/Applications"
export PATH="$APP_PATH/zig-x86_64-linux-0.15.1:$PATH"

export EDITOR=vim

export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket
