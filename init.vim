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

" Misc
Plug 'https://github.com/hashivim/vim-vagrant.git'
Plug 'https://github.com/hashivim/vim-terraform.git'
Plug 'erikzaadi/vim-ansible-yaml', { 'for' : ['yaml', 'ansible', 'markdown'] }
Plug 'joehanchoi/vim-jinja', { 'for': ['jinja', 'jinja2']}
" Misc
" Go
Plug 'fatih/vim-go', { 'for' : ['go', 'markdown'] }
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh', 'for' : ['go', 'markdown'] }
" Go
call plug#end()

colorscheme solarized

set tabstop=4      " a tab is four spaces
set expandtab
set autoindent     " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number         " always show line numbers
set showmatch   " set show matching parenthesis

