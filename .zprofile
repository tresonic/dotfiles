# dark themes and wayland
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export QT_QPA_PLATFORM=wayland
    export QT_QPA_PLATFORMTHEME=qt5ct
    export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
    # export QT_STYLE_OVERRIDE=Adwaita-Dark

    export GTK_THEME=Adwaita:dark
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
    gsettings set org.gnome.desktop.interface gtk-theme Adwaita
    gsettings set org.gnome.desktop.interface icon-theme breeze
fi


# add scripts dir to path
export PATH="$HOME/dotfiles/scripts:$PATH"
# uv
export PATH="$HOME/.local/bin:$PATH"
# apps
APP_PATH="$HOME/Applications"
export PATH="$APP_PATH:$PATH"
export PATH="$APP_PATH/zig-x86_64-linux-0.15.1:$PATH"

export EDITOR=vim

export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket
