echo "Installing Requirements"
if [ `uname` == 'Linux' ]; then 
   echo "Found Linux"
   sudo add-apt-repository ppa:neovim-ppa/unstable -y
   sudo apt-get update
   sudo apt-get install zsh git neovim highlight -y
elif [ `uname` = 'Darwin' ]; then
   echo "Found OSX"
   which -s brew
   if [[ $? != 0 ]]; then
      echo 'Installing Homebrew...'
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      echo 'Updating Homebrew...'
   fi
   [[ ! "$(type -P brew)" ]] && e_error "Homebrew failed to install." && return 1
   brew doctor
   brew update
   brew tap caskroom/cask
   brew install ansible git zsh neovim highlight hugo packer tmux z node
else
   echo "Not on OSX or Linux"
fi

echo "Installing cross-platform things"
if [ ! -d $HOME/.oh-my-zsh ]; then
   echo "Installing oh-my-zsh"
   git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh 
fi
echo "Installing vim-plug"
curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
