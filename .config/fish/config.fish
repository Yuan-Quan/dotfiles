### Prompt!! ####
starship init fish | source

#### Greatings!! ####
# Color script when open it
if test -e "/usr/bin/colorscript"
    colorscript random
end


#### Alias!! ####
# Set alias of dotfiles git bare repo
alias config="git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

# If bat availble, cat->bat
if type -q bat
     alias cat=bat
end

# If exa availble, ls->exa
if type -q exa
     alias ls=exa
end

alias l 'exa -lh --group-directories-first --time-style=long-iso --icons'
alias ll 'exa -alh --group-directories-first --time-style=long-iso --icons'
alias l. 'exa -ad .* -lh --group-directories-first --time-style=long-iso --icons'
alias lll 'exa -alh --group-directories-first --time-style=long-iso --icons --color always | less --raw-control-chars'

function tree -d "Pipe exa --tree output to less"
    command exa --color always --time-style=long-iso --group-directories-first  --icons -I '.git|.cache|pycache' --tree $argv
end

function treel -d "Pipe exa --tree output to less"
    command exa --color always --time-style=long-iso --group-directories-first  --icons -I '.git|.cache|pycache' --tree $argv | less --raw-control-chars
end

abbr tl 'treel'


#### Others!! ####
# remove './' if it is included in the $PATH, 
# which is insecure.
if set -l ind (contains -i -- ./ $fish_user_paths)
    set -e fish_user_paths[$ind]
end

source /opt/ros/noetic/share/rosbash/rosfish

alias uviz 'ROS_IP=192.168.50.101 ROS_MASTER_URI=http://192.168.50.10:11311/ rviz -d ~/ucar.rviz'

