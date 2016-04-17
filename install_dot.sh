#!/bin/bash
############################
# Install dotfile's
############################

# dotfiles folder must exist in $HOME

ln -s ~/dotfiles/.zshrc $HOME/.zshrc

ln -s ~/dotfiles/init.vim $HOME/.config/nvim/init.vim