# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/yuhuan.qiu/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell_lambda"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git web-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


################################################################################
#                                 Custom below                                 #
################################################################################


##############################
#  aliases and other custom  #
##############################

alias sudo='sudo '              # allow aliases in sudo

alias vi='vim'
alias v='vim'
# alias t='tmux -2'               # force tmux to assume term supports 256colors
# alias tmux='tmux -2'
alias serve='python -m SimpleHTTPServer 8000'

alias get="sudo brew install"
alias search="brew search"
alias info="brew info"
alias cget="sudo brew cask install"
alias csearch="brew cask search"
alias cinfo="brew cask info"

alias c="clear"
alias ..='cd ..'
alias ....='cd ../..'
alias cd..='cd ..'

alias mkdir='mkdir -v'          # verbose option

alias e='exit'
alias g=git
alias h='history'
alias :q='exit'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep -i --color=auto'
alias szsh='source ~/.zshrc'
alias dots='git --git-dir=$HOME/.dots.git/ --work-tree=$HOME'
# alias md5='md5sum'
# disable X11 forwarding and enable compression for ssh sessions
# alias ssh='TERM=xterm-256color ssh -x -C'
alias ssh='TERM=xterm-256color ssh'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        source "$BASE16_SHELL/profile_helper.sh"

base16_material


export PATH=$HOME/bin/:$PATH

# stripe
autoload -Uz bashcompinit; bashcompinit
source ~/.bashrc
#source ~/.bash_profile
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"
#source sc-aliases
#export SC_AWS_ROLE_NAME='engineers'
#alias safer-nginx="cd ~/pg/safer-nginx"
#alias gocode="cd $GOPATH/src/git.corp.stripe.com/stripe-internal/gocode"
#export PATH=/usr/local/openresty/bin:$PATH

# zsh autosuggestions
#source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH=$PATH:/opt/homebrew/bin

