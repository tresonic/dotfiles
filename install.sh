#!/usr/bin/env bash

# install packages
sudo pacman -S -needed - < pkglist.txt

# install yay
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si && cd .. && rm -rf yay-bin

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

