# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="agnoster"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(web-search sudo tmux extract z sublime vagrant brew alias-tips)

# User configuration
# Linux Check
if [[ $(uname) = 'Linux' ]]; then
   IS_LINUX=1
fi
# OSX Check
if [[ $(uname) = 'Darwin' ]]; then
   IS_MAC=1
fi
# Homebrew Check
if [[ -x `which brew` ]]; then
   HAS_BREW=1
fi
# apt-get check
if [[ -x `which apt-get` ]]; then
   HAS_APT=1
fi
# yum check
if [[ -x `which yum` ]]; then
   HAS_YUM=1
fi
# Local non-ssh only settings
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
else
   DEFAULT_USER=`whoami`
   # *See here for pip stuff: https://hackercodex.com/guide/python-development-environment-on-mac-osx/
   # *Requires you to be in a virtualenv for pip to install python packages
   export PIP_REQUIRE_VIRTUALENV=true
fi

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# *Added for Golang Development
export GOPATH=$HOME/Code/Go
export PATH=$PATH:$GOPATH/bin

# *Allow overridding of pip virtualenv restriction
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# SAWS always use saml .aws/credentials profile
export AWS_DEFAULT_PROFILE=saml

export EDITOR='vim'

source $ZSH/oh-my-zsh.sh

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# alias-tip plugin custom text
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Wubalubadubdub you got an Alias for that!: "

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias zshconfig="vim ~/.zshrc"
# Use NeoVim instead of Vim
alias vim="nvim"
# cat with syntax highlighting
alias cats='highlight -O ansi'
. `brew --prefix`/etc/profile.d/z.sh

# Options
# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD

# 10 second wait if you do something that will delete everything.  I wish I'd had this before...
setopt RM_STAR_WAIT

# Shell Conveniences
alias sz='source ~/.zshrc'
alias ez='vim ~/.zshrc'
#alias mk=popd

# Vagrant Up & SSH in the same line
alias 'vus'='vagrant up && vagrant ssh'

# Linux specific things
if [[ $IS_LINUX -eq 1 ]]; then
    alias ls='pwd; ls -laFh --color=auto'
fi

# OSX Specific Things
if [[ $IS_MAC -eq 1 ]]; then
  # Lets make standard ls prettier
  alias ls='pwd; ls -laGFh'
  eval "$(thefuck --alias)"
  # Send stuff to OSX Trash
  alias rm='trash'
fi

# Load MOTD {{{
# Need to get random selection of motd message working
if [[ -d ~/dotfiles/motd ]]; then
    for motd in ~/dotfiles/motd/*; do
       cat $motd
    done
fi
# }}}