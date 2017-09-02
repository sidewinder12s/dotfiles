#! /bin/sh

# Post docker build configuration
# User & filesystem mounts required
ln -sf /home/vagrant/dotfiles/.zshrc /home/vagrant/.zshrc
ln -sf /home/vagrant/dotfiles/init.vim /home/vagrant/.config/nvim/init.vim
sed -i 's/ZSH_THEME=\"agnoster\"/ZSH_THEME=\"avit\"/g' /home/vagrant/.zshrc
sudo chsh -s /bin/zsh vagrant
