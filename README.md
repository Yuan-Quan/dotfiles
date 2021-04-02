# My dotfiles

Repo to manage my dotfiles

## TODO

To track
* [x] xmonad config
* [x] .vimrc
* [x] .bashrc
* [x] config for jonaburg/picom
* [x] config for alarcritty
* [x] fish shell config&functions
* [ ] some game saves

## Get Started

after git was setup properly, pull dotfiles:
```bash
cd ~
git clone --bare https://github.com/Yuan-Quan/dotfiles.git
mv dotfiles.git .dotfiles.git
# This line is already in .config/fish/fish.config, but you do need to run it onece.
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
# Prevent untracked files from showing up when we call dotfiles status.
config config --local status.showUntrackedFiles no
#apply config files
config pull
config reset --hard HEAD
```

after clash is up and running:
```bash
cd ~
sudo ln -s setProxy.sh /etc/profile.d/setProxy.sh
```
