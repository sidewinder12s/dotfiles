echo "Installing Requirements"
if [ `uname` == 'Linux' ]; then 
   sudo add-apt-repository ppa:neovim-ppa/unstable -y
   sudo apt-get update
   sudo apt-get install zsh git neovim highlight -y
   git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh 
   curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
elif [ uname = 'Darwin']; then
   which -s brew
   if [[ $? != 0 ]]; then
      echo 'Installing Homebrew...'
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      echo 'Updating Homebrew...'
      brew doctor
      brew update
   fi
   [[ ! "$(type -P brew)" ]] && e_error "Homebrew failed to install." && return 1
   brew tap caskroom/cask
   brew install ansible git zsh neovim highlight hugo packer tmux z 
   git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh 
   curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
   echo "Not on OSX or Linux"
fi
