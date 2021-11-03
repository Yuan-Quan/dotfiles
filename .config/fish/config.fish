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


#### Others!! ####
# remove './' if it is included in the $PATH, 
# which is insecure.
if set -l ind (contains -i -- ./ $fish_user_paths)
    set -e fish_user_paths[$ind]
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/cirno/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

