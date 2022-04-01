#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PATH=~/.npm-global/bin:$PATH

export PATH=/usr/local/cuda-11.6/bin${PATH:+:${PATH}}

# CUDA
export LD_LIBRARY_PATH=/usr/local/cuda-11.6/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

export ROS_PYTHON_VERSION=3

# remote car
#export ROS_IP=192.168.50.10
#export ROS_MASTER_URI=http://192.168.50.10:11311

source /opt/ros/noetic/setup.bash

# google cartographer
#source /home/cirno/local/cartographer_ws/devel_isolated/setup.bash

#source /home/cirno/source/repos/15th_car/devel/setup.bash

# Fish as interactive shell
exec &fish

. "$HOME/.cargo/env"
