#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

source /opt/ros/melodic/setup.bash

# export ROS_PYTHON_VERSION=3

# Fish as interactive shell
exec fish
