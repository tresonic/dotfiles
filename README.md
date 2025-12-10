# tresonic's dotfiles

after cloning:
```shell
# install dotfiles
stow . --adopt

# enable ssh-agent, starting from .profile not possible in sway
systemctl --user enable --now ssh-agent.service
```
