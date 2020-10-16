#!/usr/bin/env bash 
# Creates a set of symlinks to the dot files in dotfiles dir.
# clone the dotfiles directory from pobept63 bitbucket hg repo first
# stick this in ~/bin

DOTFILES=$PWD

echo " DOTFILES = $DOTFILES "
if [ -f ~/.bashrc ]
then
    mv ~/.bashrc ~/.bashrc.old
fi

for i in bash_profile bashrc bash_aliases zsh_aliases zsh zshrc zshenv \
    vimrc vim  tmux.conf muttrc
do
	if [ -e ~/.$i ]
    then
        if [ ! -e ~/olddotfiles ]
        then
            mkdir ~/olddotfiles
        fi
        mv ~/.$i ~/olddotfiles
    fi
    if [ ! -e ~/.$i ]
    then
        echo "Creating symlink ~/.$i to $DOTFILES/$i "
        ln -sf $DOTFILES/$i ~/.$i
    fi
done

for i in nvim ranger
do
	if [ -e ~/.config/$i ]
    then
        if [ ! -e ~/olddotfiles ]
        then
            mkdir ~/olddotfiles
        fi
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
