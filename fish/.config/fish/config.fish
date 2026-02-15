
set -gx PATH  ~/bin  /usr/local/bin $PATH
# └── new dir here ──┘  └── then append the existing PATH

#set -gx PATH /opt/homebrew/bin $PATH
set -gx EDITOR nvim

# not set by default on mac os
set -x XDG_CONFIG_HOME "$HOME/.config"

alias vim nvim
fish_default_key_bindings

# Set up fzf key bindings
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


function ls
    eza -l --sort=newest --reverse --group-directories-first --color=always $argv
end

function new --description 'List newest N entries with colors using eza'
    set -l n 10
    if test (count $argv) -ge 1
        set n $argv[1]
    end
    eza -l --sort=modified --reverse --color=always | head -n $n
end

# using fd, a rust based faster find
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --exclude Library --exclude .git --exclude node_modules'


# cd to directory of selected file
function fcd
    set file (fzf)
    and cd (dirname $file)
end

# cd to directory directly (searches only directories)
function fdir
    set dir (fd --type d --hidden --exclude Library | fzf)
    and cd $dir
end

set fish_prompt_pwd_dir_length 0

