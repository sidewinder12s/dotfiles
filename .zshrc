# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

### Must be set before loading bullettrain zsh theme
BULLETTRAIN_CONTEXT_DEFAULT_USER=(gwebster)
BULLETTRAIN_CONTEXT_IS_SSH_CLIENT=(true)
BULLETTRAIN_CONTEXT_BG=(white)
BULLETTRAIN_CONTEXT_FG=(black)
#BULLETTRAIN_CUSTOM_MSG=(λ)
BULLETTRAIN_CUSTOM_BG=(green)
BULLETTRAIN_CUSTOM_FG=(white)

BULLETTRAIN_PROMPT_ORDER=(
  context
  dir
  status
  virtualenv
  git
)
BULLETTRAIN_PROMPT_CHAR=''
BULLETTRAIN_PROMPT_SEPARATE_LINE=(false)
BULLETTRAIN_PROMPT_ADD_NEWLINE=(false)
### Required for a lot of these nicer zsh themes that have a lot of color
export TERM="xterm-256color"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="bullet-train"

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
plugins=(web-search
        git-extra-commands
        sudo
        macos
        tmux
        extract
        z
        sublime
        vagrant
        brew
        alias-tips
        docker
        colored-man-pages
        ubuntu
)

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
   #export PIP_REQUIRE_VIRTUALENV=true
fi

export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin

# *Added for Golang Development
export PATH=$PATH:$GOPATH/bin

export EDITOR='code --wait'

source $ZSH/oh-my-zsh.sh

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
alias cats='highlight -O ansi --force'

alias kp='kubectl get pods -o wide'

alias k="kubectl"

# Options
# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD

# 10 second wait if you do something that will delete everything.  I wish I'd had this before...
setopt RM_STAR_WAIT

# Shell Conveniences
alias sz='source ~/.zshrc'
alias ez='vim ~/.zshrc'
#alias mk=popd
alias awscreds='cat ~/.aws/credentials'

# Linux specific things
if [[ $IS_LINUX -eq 1 ]]; then
    alias ls='pwd; ls -laFh --color=auto'
    # Alias for macOS cli clipboard for ubuntu
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'

    # Send to Ubuntu Trash
    #alias rm='gvfs-trash'
fi

# OSX Specific Things
if [[ $IS_MAC -eq 1 ]]; then
  # Lets make standard ls prettier
  alias ls='pwd; ls -laGFh'
  eval "$(thefuck --alias)"
  # Send stuff to OSX Trash
  alias rm='trash'
  # Open current directory in Finder
  alias finder='ofd'
  . `brew --prefix`/etc/profile.d/z.sh
fi

# Load MOTD {{{
# Need to get random selection of motd message working
if [[ -d ~/dotfiles/motd ]]; then
    for motd in ~/dotfiles/motd/*; do
       cat $motd
    done
fi
# }}}

eval "$(mcfly init zsh)"

# Starship
#eval "$(starship init zsh)"

# kubectl krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

function gissh () {
 gcloud beta compute ssh --tunnel-through-iap $1
}

function unset-aws {
  unset AWS_ACCESS_KEY_ID;
  unset AWS_SECRET_ACCESS_KEY;
  unset AWS_SESSION_TOKEN;
  unset AWS_PROFILE;
}

# https://superuser.com/questions/439209/how-to-partially-disable-the-zshs-autocorrect
unsetopt correct_all
setopt correct

source <(kubectl completion zsh)

# Seems to fix command outputs to not take over the screen
export LESS="-RXF"

export AWS_DEFAULT_REGION=us-east-1

# Don't open a text editor for merges without a message.
export GIT_MERGE_AUTOEDIT=no

