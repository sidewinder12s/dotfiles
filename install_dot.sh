#!/bin/bash
############################
# Install dotfile's
############################

# dotfiles folder must exist in $HOME

ln -sf ~/dotfiles/.zshrc $HOME/.zshrc

ln -sf ~/dotfiles/init.vim $HOME/.config/nvim/init.vim
