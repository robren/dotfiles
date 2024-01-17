
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
source $ZSH_PLUGIN_DIR/powerlevel10K/powerlevel10k.zsh-theme

source $ZSH_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh



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
alias ls='exa -la --long --header --color=always --sort=old --git --group-directories-first'
alias vim='nvim'
alias new='exa -la --long --header --color=always --sort=old --git | head -n 20 '
# alias new='exa -la --long --header --color=always --sort=modified --reverse | less -y 20 '
alias tree='exa -T'
alias h='history'
alias ..='cd ..'

# Load and initialise completion system
autoload -Uz compinit
compinit
