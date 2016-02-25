# dotfiles

All of my dotfiles, uses symlinks to point the usual suspects to files residing under the dotfiles directory

Inspiration for the dotfiles and symlinks "trick" from https://github.com/nelstrom/dotfiles

Whilst this sets up all of the dotfiles and symlinks it does not perform the
installation of needed packages. The ansible playbook in my ansible repo works
with this dotfiles repo.

## Installation 

Source the setupdotfiles.sh program, it: 

- creates symlinks to the various dotfiles 
  e.g   ones for .bashrc for .vimrc .vim .tmux.conf ...
- It then clones the git submodules containing various Vim packages

Preferences for Vim are stored in dotfiles/vimrc  
All plugins and scripts are stored in the dotfiles/vim directory.

## Tmux
The tmux.conf is included in the dotfiles;however  more steps are needed.
- The tmux package needs to be installed, ansible will do this
- To get the the tmux plugins installed there's a manual step
    - From within tmux "prefix + I" capital I
    - This will pull down the tmux plugins from their git repo and install
      them

## Issues
- Vim Visual selection  highlighting mode does not highlight
  - Could be a linux gnome term issue, worked well on MAC
- This is tested and optimized for a zsh setup, a very basic bash setup
