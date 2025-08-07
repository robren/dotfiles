
set -gx PATH  ~/bin  /usr/local/bin $PATH
# └── new dir here ──┘  └── then append the existing PATH
set -gx EDITOR nvim

# not set by default on mac os
set -x XDG_CONFIG_HOME "$HOME/.config"

alias vim nvim

# Set up fzf key bindings
fzf --fish | source
fzf --fish | source

zoxide init fish | source

abbr -a gs   'git status'
abbr -a ga   'git add'
abbr -a gc   'git commit -m '
abbr -a gl   'git pull'

# push master→origin/master
abbr -a gpm  'git push origin master'
# push + set upstream for future plain `gp`
abbr -a gpmu 'git push -u origin master'

abbr -a gp  'git push'

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/Rob/.cache/lm-studio/bin
# End of LM Studio CLI section

