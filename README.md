# My dotfiles

This repo is used to manage my dotfiles

## TODO

To track
* [x] xmonad config
* [x] .vimrc
* [x] config for jonaburg/picom
* [x] config for alarcritty
* [x] fish shell config&functions
* [x] plasma-workspace/env

## Get Started

make life easier:
```
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
```
This line is already in .config/fish/fish.config.

auto start yakuake on login
```
ln -s /usr/share/applications/org.kde.yakuake.desktop ~/.kde/Autostart/
```
alternatively, use kde system settings

