#!/usr/bin/env bash 
# Creates a set of symlinks to the dot files in dotfiles dir.
# clone the dotfiles directory from pobept63 bitbucket hg repo first
# stick this in ~/bin

set -x

DOTFILES=$PWD

echo " DOTFILES = $DOTFILES "
if [ -f ~/.bashrc ]
then
    mv ~/.bashrc ~/.bashrc.old
fi

for i in bash_profile bashrc bash_aliases zsh_aliases zsh vimrc vim \
    tmux.conf  
do
    if [ ! -e ~/.$i ]
    then
        ln -sf $DOTFILES/$i ~/.$i  
    fi
done

# put Vim's backup and swapfiles in here
if [ ! -d ~/.vimbackups ]
then
    mkdir ~/.vimbackups
fi

unset GNOME_KEYRING_CONTROL

# Need to pull in the git submodules
git submodule init
git submodule update
