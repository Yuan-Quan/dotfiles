" the VIM-Pug !!!!!, place your plugins here!!
call plug#begin('~/.vim/plugged')
 " this makes the vim looks awsome
 Plug 'https://github.com/vim-airline/vim-airline.git'
 Plug 'vim-airline/vim-airline-themes'
 " file explor
 Plug 'scrooloose/nerdtree'
 Plug 'Xuyuanp/nerdtree-git-plugin'
 Plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight.git'
 " 🌸 A command-line fuzzy finder for VIM
 Plug 'https://github.com/junegunn/fzf.vim.git'
 " the indention levels with thin vertical lines
 Plug 'https://github.com/Yggdroot/indentLine.git'
 " auto-completion for quotes, parens, brackets, etc
 Plug 'https://github.com/Raimondi/delimitMate.git'
call plug#end()

" Configs
 set number
 " pre command
   " to enable the airline view 
   let g:airline#extensions#tabline#enabled = 1
   let g:airline_powerline_fonts = 1
   " set the theme
   let g:airline_theme='fruit_punch'
   " auto open nerd tree
   " autocmd vimenter * NERDTree
   " show hidden .files
   let NERDTreeShowHidden=1
   " enable the indnet line
   let g:indentLine_enabled = 1

" :r $VIMRUNTIME/.vimrc_example
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
"Auto close vim if only explore left open 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
