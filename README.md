# My dotfiles

Repo to manage my dotfiles

## TODO

none

## Get Started

after git, pwsh ececution policy was setup properly, pull dotfiles:
```bash
cd ~
git clone --bare https://github.com/Yuan-Quan/dotfiles.git
Rename-Item dotfiles.git .dotfiles.git
Install-Module -Name HackF5.ProfileAlias
Set-ProfileAlias -Name config -Command "git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME #{*}" -Bash
# Prevent untracked files from showing up when we call dotfiles status.
config config --local status.showUntrackedFiles no
#apply config files
config reset --hard HEAD
```

