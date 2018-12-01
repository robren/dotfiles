# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export GOPATH=$HOME/code/go

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"
#ZSH_THEME="ys"
#ZSH_THEME="frisk"
#ZSH_THEME="cypher"
#ZSH_THEME="powerlevel9k/powerlevel9k"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
#plugins=(git)

# Added since the  zshvirtualenvwrapper and virtual env were not working

#echo "sourcing the virtualenvwrapper"
source /usr/bin/virtualenvwrapper.sh
#plugins=(git docker docker-compose,virtualenv,virtualenvwrapper,go)
plugins=(git docker docker-compose go safe-paste)

# User configuration
TEXBINPATH="/usr/local/texlive/2017/bin/x86_64-linux"
TEXMANPATH="/usr/local/texlive/2017/texmf-dist/doc/man"
TEXINFOPATH="/usr/local/texlive/2017/texmf-dist/doc/info"

PYTHONLOCALPATH="$HOME/.local/bin"
#export PATH="$PATH:/usr/local/go/bin:$HOME/bin:$HOME/algs4/bin"
export PATH="$PATH:$HOME/bin:$PYTHONLOCALPATH:$TEXBINPATH"
# export MANPATH="/usr/local/man:$MANPATH"
export MANPATH="$MANPATH:$TEXMANPATH"
export INFOPATH="$INFOPATH:$TEXINFOPATH"

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
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
## =======================================================

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

# eval $(dircolors $HOME/.dircolors)

#export TERM=screen-256color
if [ "$TERM" = "xterm" ] ; then
    export TERM=xterm-256color 
fi

export WORKON_HOME=$HOME/VirtualEnvs
export PROJECT_HOME=$HOME/Devel
#TODO insstall
#source /usr/local/bin/virtualenvwrapper.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/test/tools/google-cloud-sdk/path.zsh.inc' ]; then source '/home/test/tools/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/test/tools/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/test/tools/google-cloud-sdk/completion.zsh.inc'; fi

source ~/bin/quandl-env.sh
source ~/bin/alpha-vantage-env.sh
source ~/bin/tiingo-env.sh

alias clear_history='echo "" > ~/.zsh_history & exec $SHELL -l'
