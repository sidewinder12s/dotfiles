echo "INSTALL_DOT_REQ: Installing Requirements"
if [ `uname` = 'Linux' ]; then
   echo "INSTALL_DOT_REQ: Found Linux"
   sudo add-apt-repository ppa:neovim-ppa/unstable -y
   sudo apt-get update
   sudo apt-get install zsh git neovim highlight curl tmux -y
elif [ `uname` = 'Darwin' ]; then
   echo "INSTALL_DOT_REQ: Found OSX"
   which -s brew
   if [[ $? != 0 ]]; then
      echo 'IINSTALL_DOT_REQ: nstalling Homebrew...'
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      echo 'INSTALL_DOT_REQ: Updating Homebrew...'
   fi
   [[ ! "$(type -P brew)" ]] && e_error "INSTALL_DOT_REQ: Homebrew failed to install." && return 1
   brew doctor
   brew update
   brew tap caskroom/cask
   brew install ansible git zsh neovim highlight hugo packer tmux z node
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

echo "INSTALL_DOT_REQ: Installing alias-tips zsh plugin"
if [ ! -d ${ZSH_CUSTOM1:-$ZSH/custom}/plugins/alias-tips ]; then
   cd ${ZSH_CUSTOM1:-$ZSH/custom}/plugins
   git clone https://github.com/djui/alias-tips.git
fi
