#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# setup ROS
source /opt/ros/noetic/setup.bash
source /home/cirno/catkin_ws/devel/setup.bash

alias config="git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
alias ..="cd .."

# replace ls with exa
if command -v exa &> /dev/null
then
	alias ls='exa'
	alias la='exa -la'
else
	alias ls='ls --color=auto'
fi

# replace cat with bat
if command -v bat &> /dev/null
then
	alias cat='bat'
fi


PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
