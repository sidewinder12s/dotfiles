#!/bin/bash
############################
# .make.sh
# Install dotfile root requirements
############################

sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-get update
sudo apt-get install zsh git neovim highlight -y
git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh 
curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
