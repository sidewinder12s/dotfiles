echo "INSTALL_DOT_REQ: Installing Requirements"
if [ `uname` = 'Linux' ]; then
   echo "INSTALL_DOT_REQ: Found Linux"
   sudo add-apt-repository ppa:neovim-ppa/unstable -y

   # vscode
   wget -O code.deb https://go.microsoft.com/fwlink/?LinkID=760868
   sudo apt install ./code.deb

   # Install mcfly
   curl -LSfs https://raw.githubusercontent.com/cantino/mcfly/master/ci/install.sh | sudo sh -s -- --git cantino/mcfly

   sudo apt-get update
   sudo apt-get install fonts-powerline zsh git neovim highlight curl tmux jq xclip -y
elif [ `uname` = 'Darwin' ]; then
   echo "INSTALL_DOT_REQ: Found OSX"
   which -s brew
   if [[ $? != 0 ]]; then
      echo 'INSTALL_DOT_REQ: Installing Homebrew...'
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      echo 'INSTALL_DOT_REQ: Updating Homebrew...'
   fi
   [[ ! "$(type -P brew)" ]] && e_error "INSTALL_DOT_REQ: Homebrew failed to install." && return 1
   brew doctor
   brew update
   brew tap caskroom/cask
   brew tap cantino/mcfly
   brew install ansible git zsh neovim/neovim/neovim highlight hugo packer tmux z node code mcfly
else
   echo "INSTALL_DOT_REQ: Not on OSX or Linux"
fi

echo "INSTALL_DOT_REQ: Installing cross-platform things"
if [ ! -d $HOME/.oh-my-zsh ]; then
   echo "INSTALL_DOT_REQ: Installing oh-my-zsh"
   git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
fi
echo "INSTALL_DOT_REQ: Installing vim-plug"
curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "INSTALL_DOT_REQ: Installing bullet-train zsh theme"
curl -fLo $HOME/.oh-my-zsh/custom/themes/bullet-train.zsh-theme --create-dirs  http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme

echo "INSTALL_DOT_REQ: Installing alias-tips zsh plugin"
if [ ! -d $HOME/.oh-my-zsh/custom/plugins/alias-tips ]; then
   cd $HOME/.oh-my-zsh/custom/plugins
   git clone https://github.com/djui/alias-tips.git
fi

echo "INSTALL_DOT_REQ: Installing git-extra-commands zsh plugin"
if [ ! -d $HOME/.oh-my-zsh/custom/plugins/git-extra-commands ]; then
   cd $HOME/.oh-my-zsh/custom/plugins
   git clone https://github.com/unixorn/git-extra-commands.git
fi

# new stuff
# Starship
# sh -c "$(curl -fsSL https://starship.rs/install.sh)"
