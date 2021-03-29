# My dotfiles

This repo is used to manage my dotfiles

## TODO

To track
* [x] xmonad config
* [x] .vimrc
* [ ] .bashrc
* [x] config for jonaburg/picom
* [x] config for alarcritty
* [x] fish shell config&functions
* [ ] some game saves

## Get Started

after git was setup properly, pull dotfiles:
```bash
cd ~
git clone https://github.com/Yuan-Quan/dotfiles.git
mv dotfiles.git .dotfiles.git
# This line is already in .config/fish/fish.config, but you do need to run it onece.
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
# Prevent untracked files from showing up when we call dotfiles status.
config config --local status.showUntrackedFiles no
config pull
```
