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

# Fish as interactive shell
exec fish

