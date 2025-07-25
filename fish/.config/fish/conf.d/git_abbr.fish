# ~/.config/fish/conf.d/git_abbr.fish
# Essential Git abbreviations - kept minimal

# Daily essentials (80% of what you use)
abbr -a g git
abbr -a gs git status
abbr -a ga git add
abbr -a gc git commit -m
abbr -a gp git push
abbr -a gl git pull

# Branch basics
abbr -a gco git checkout
abbr -a gcb git checkout -b
abbr -a gb git branch

# Logs and diffs
abbr -a gd git diff
abbr -a glo git log --oneline

# Quick combos
abbr -a gac git add -A && git commit -m
abbr -a gap git add -p
