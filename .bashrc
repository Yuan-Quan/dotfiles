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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/cirno/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/cirno/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/cirno/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/cirno/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

