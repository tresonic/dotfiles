#!/usr/bin/env bash

set -euo pipefail

# install yay
if ! command -v yay &> /dev/null
then
  git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si && cd .. && rm -rf yay-bin
fi

# install packages
# yay -S --needed - < pkglist.txt

# install oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

