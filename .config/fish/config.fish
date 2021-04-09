# Color script when open it
colorscript random

# Set alias of dotfiles git bare repo
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

# If bat availble, cat->bat
if test -e "/usr/bin/bat"
     alias cat="/usr/bin/bat"
end

# If exa availble, ls->exa
if test -e "/usr/bin/exa"
     alias ls="/usr/bin/exa"
end
