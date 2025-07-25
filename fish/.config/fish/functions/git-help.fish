# ~/.config/fish/functions/git-help.fish
# Show git abbreviations with descriptions

function git-help --description "Show git abbreviations"
    echo "Git Abbreviations:"
    echo "  g    → git"
    echo "  gs   → git status"
    echo "  ga   → git add"
    echo "  gc   → git commit -m"
    echo "  gp   → git push"
    echo "  gl   → git pull"
    echo "  gco  → git checkout"
    echo "  gcb  → git checkout -b"
    echo "  gb   → git branch"
    echo "  gd   → git diff"
    echo "  glo  → git log --oneline"
    echo "  gac  → git add -A && git commit -m"
    echo "  gap  → git add -p"
end
