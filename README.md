# dotfiles

install:
```shell
mkdir -p ~/.config ~/.vim
# install dotfiles
stow . --adopt

# enable ssh-agent, starting from .profile not possible in sway
systemctl --user enable --now ssh-agent.service
```

install yay:
```shell
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si && cd .. && rm -r yay-bin
```

enable lightdm:
```shell
sudo systemctl enable lightdm.service
```

enable wob (floating volume/brightness bar):
```shell
sudo systemctl enable --now --user wob.socket
```

enable syncthing:
```shell
sudo systemctl enable --now syncthing@<myuser>.service
```

switch to zsh:
```shell
chsh -s $(which zsh)
```

add udevmon config file for mapping caps to esc and ctrl with interception-caps2esc
```yaml
# /etc/interception/udevmon.d/caps2esc.yml
- JOB: intercept -g $DEVNODE | caps2esc | uinput -d $DEVNODE
  DEVICE:
    EVENTS:
      EV_KEY: [KEY_CAPSLOCK, KEY_ESC]
```
also enable `udevmon.service`
