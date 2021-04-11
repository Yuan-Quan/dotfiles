### Prompt!! ####
starship init fish | source


#### Greatings!! ####
# Color script when open it
colorscript random


#### Alias!! ####
# Set alias of dotfiles git bare repo
alias config="git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

# If bat availble, cat->bat
if test -e "/usr/bin/bat"
     alias cat="/usr/bin/bat"
end

# If exa availble, ls->exa
if test -e "/usr/bin/exa"
     alias ls="/usr/bin/exa"
end


#### Others!! ####
# remove './' if it is included in the $PATH, 
# which is insecure.
if set -l ind (contains -i -- ./ $fish_user_paths)
    set -e fish_user_paths[$ind]
end
