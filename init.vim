let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax enable
set background=dark " or dark

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'https://github.com/altercation/vim-colors-solarized.git'

Plug 'https://github.com/hashivim/vim-vagrant.git'
Plug 'https://github.com/hashivim/vim-terraform.git'

call plug#end()

colorscheme solarized

set tabstop=3     " a tab is four spaces
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set showmatch     " set show matching parenthesis

