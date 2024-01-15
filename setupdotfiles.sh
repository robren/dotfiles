#!/usr/bin/env bash 
#
# Creates a set of symlinks to the dot files in dotfiles dir.
# clone the dotfiles repo from  https://github.com/robren/dotfiles 
# Execute this script from within the dotfiles directory 

DOTFILES=$PWD

echo " DOTFILES = $DOTFILES "

if [ ! -e ~/olddotfiles ]
then
    mkdir ~/olddotfiles
fi

# Until I'm back to using mutt and ack, comment out
# muttrc
# ackrc
for i in bash_profile bashrc bash_aliases zsh_aliases zsh zshrc \
    vimrc vim  tmux.conf 
do
	if [ -e ~/.$i ]     # Save the old dotfiles
    then
        mv ~/.$i ~/olddotfiles
  fi
  if [ ! -e ~/.$i ]   # Create a symlink to the dotfiles in this repo
    then
        echo "Creating symlink ~/.$i to $DOTFILES/$i "
        ln -sf $DOTFILES/$i ~/.$i
  fi
done

for i in nvim ranger
do
	if [ -e ~/.config/$i ]
    then
        mv ~/.config/$i ~/olddotfiles
    fi
    if [ ! -e ~/.config/$i ]
    then
        echo "Creating symlink ~/.config/$i to $DOTFILES/$i "
        ln -sf $DOTFILES/$i ~/.config/$i
    fi
done

# put Vim's backup and swapfiles in here
if [ ! -d ~/.vimbackups ]
then
    mkdir ~/.vimbackups
fi

unset GNOME_KEYRING_CONTROL

# Need to pull in the git submodules
# Since we moved to the Plug installer no need for this.
# git submodule init
# git submodule update

# clone the Tmux plugin repo
if [ ! -e ~/.tmux/plugins ]
then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
