# tresonic's dotfiles

install:
```shell
# install dotfiles
stow . --adopt

# enable ssh-agent, starting from .profile not possible in sway
systemctl --user enable --now ssh-agent.service
```

install yay:
```shell
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
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
