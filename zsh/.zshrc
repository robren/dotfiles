
# Inserted by the first run of the powerlevel10
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export ZSH_PLUGIN_DIR=$HOME/.local/share/zsh-plugins
source $ZSH_PLUGIN_DIR/powerlevel10k/powerlevel10k.zsh-theme

source $ZSH_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export RANGER_LOAD_DEFAULT=FALSE

## Added by me
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Set personal aliases, overriding those provided by libs,
# plugins, and themes. Aliases can be placed here, 
# users are encouraged to define aliases within th
#

# Cannot use the --git option iin ubuntu version of exa
#alias ls='exa -la --long --header --color=always --sort=old --git --group-directories-first'
#alias ls='exa -la --long --header --color=always --sort=old  --group-directories-first'
#alias ls='exa --header --color=always --sort=old  --group-directories-first'
#alias ls='exa -la -l --header --color=always  --sort=old '
alias vim='nvim'
## the --git option gives erros with the version of exa I install in ubuntu
#alias new='exa -la --long --header --color=always --sort=old --git | head -n 20 '
alias new='eza -la --long --header --color=always --sort=old  | head -n 20 '
# alias new='exa -la --long --header --color=always --sort=modified --reverse | less -y 20 '
alias tree='eza -T'
alias h='history'
alias ..='cd ..'
alias gst='git status'
alias vz='nvim ~/.zshrc'
# alias z='zoxide'

# Load and initialise completion system
autoload -Uz compinit
compinit

# from the README this initialization must be run after compinit
eval "$(zoxide init zsh )"

# Turn of the annoying bell when there is no autocomplete
unsetopt beep

bindkey -e 


export PATH="$HOME/bin:$PATH"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/Rob/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/Rob/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/Rob/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/Rob/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<




