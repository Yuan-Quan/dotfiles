#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PATH=~/.npm-global/bin:$PATH

export PATH=/usr/local/cuda-11.6/bin${PATH:+:${PATH}}

export LD_LIBRARY_PATH=/usr/local/cuda-11.6/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

export ROS_PYTHON_VERSION=3

source /opt/ros/noetic/setup.bash

source /home/cirno/source/repos/15th_car/devel/setup.bash

# Fish as interactive shell
exec fish

