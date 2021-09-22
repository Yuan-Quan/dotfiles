#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias config="git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

# replace ls with exa
if command -v exa &> /dev/null
then
	alias ls='exa'
	alias la='exa -la'
else
	alias ls='ls --color=auto'
fi

PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
