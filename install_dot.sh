#!/bin/bash
############################
# Install dotfile's
############################

# dotfiles folder must exist in $HOME
echo "INSTALL_DOT: Symlinking .zshrc"
ln -sf ~/dotfiles/.zshrc $HOME/.zshrc

echo "INSTALL_DOT: Symlinking init.vim"
ln -sf ~/dotfiles/init.vim $HOME/.config/nvim/init.vim

# dotfiles folder must exist in $HOME
echo "INSTALL_DOT: Symlinking .zshrc"
ln -sf ~/dotfiles/.terraformrc $HOME/.terraformrc
