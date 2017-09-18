#!/usr/bin/env bash 

# used for initial setup of the git submodules  repo (not for general use). Use setupdotfiles.sh after having cloned the dotfiles
# repo

git submodule add https://github.com/vim-scripts/FuzzyFinder.git vim/bundle/FuzzyFinder
git submodule add https://github.com/vim-scripts/abolish.vim.git vim/bundle/abolish.vim
git submodule add https://github.com/scrooloose/nerdtree.git vim/bundle/nerdtree
git submodule add https://github.com/vim-scripts/L9.git vim/bundle/L9
git submodule add http://github.com/ctrlpvim/ctrlp.vim vim/bundle/ctrlp.vim
git submodule add https://github.com/vim-scripts/ucompleteme.git vim/bundle/ucompleteme
git submodule add https://github.com/jeetsukumaran/vim-buffergator.git vim/bundle/vim-buffergator
git submodule add https://github.com/fatih/vim-go.git vim/bundle/vim-go
git submodule add https://github.com/ntpeters/vim-better-whitespace vim/bundle/vim-better-whitespace




