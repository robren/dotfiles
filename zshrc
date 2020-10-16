# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh



export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="af-magic"
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
#ZSH_THEME="avit"
#ZSH_THEME="frisk"
#ZSH_THEME="cypher"
#ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="robbyrussell"
#

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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

plugins=(git docker docker-compose go safe-paste)

# User configuration

TEXMANPATH="/usr/local/texlive/2019/texmf-dist/doc/man"
TEXINFOPATH="/usr/local/texlive/2019/texmf-dist/doc/info"

export MANPATH="$MANPATH:$TEXMANPATH"
# This caused problems with emacs. This overrode the correctly set values 
# in the variable info-default-directory-list
# export INFOPATH="$INFOPATH:$TEXINFOPATH:"

source $ZSH/oh-my-zsh.sh

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

#export WORKON_HOME=$HOME/VirtualEnvs
#export PROJECT_HOME=$HOME/Devel
#source /usr/local/bin/virtualenvwrapper.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/test/tools/google-cloud-sdk/path.zsh.inc' ]; then source '/home/test/tools/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/test/tools/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/test/tools/google-cloud-sdk/completion.zsh.inc'; fi

source ~/bin/quandl-env.sh
source ~/bin/alpha-vantage-env.sh
source ~/bin/tiingo-env.sh

alias clear_history='echo "" > ~/.zsh_history & exec $SHELL -l'

export EDITOR=nvim


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Setting fd as the default source for fzf
# export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Needed to fix a problem where pip was aborting due to some problem with
# an encryption library after a recent MACOS update.
export DYLD_LIBRARY_PATH=/usr/local/opt/openssl/lib:$DYLD_LIBRARY_PATH

eval "$(pyenv init -)"
