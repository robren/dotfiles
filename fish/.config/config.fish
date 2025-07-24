
# Put your new directory first, or at the end—either works:
set -gx PATH ~/bin $PATH
# └── new dir here ──┘  └── then append the existing PATH

alias vim nvim

# Set up fzf key bindings
fzf --fish | source
fzf --fish | source

zoxide init fish | source
