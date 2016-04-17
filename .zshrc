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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(web-search sudo tmux extract z sublime vagrant brew)

# User configuration

# *Hides username/hostname on console when on local machine
#DEFAULT_USER=`whoami`
# This version is so vagrant boxes are clearly not OSX
DEFAULT_USER=gwebster

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# *Added for Golang Development
export GOPATH=$HOME/Code/Go
export PATH=$PATH:$GOPATH/bin

# *See here for pip stuff: https://hackercodex.com/guide/python-development-environment-on-mac-osx/
# *Requires you to be in a virtualenv for pip to install python packages
export PIP_REQUIRE_VIRTUALENV=true

# *Allow overridding of pip virtualenv restriction
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# SAWS always use saml .aws/credentials profile
export AWS_DEFAULT_PROFILE=saml

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

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
