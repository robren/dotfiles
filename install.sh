#!/usr/bin/env bash
# set -x # Print debugging output

# Update package lists and install dependencies if needed
sudo apt-get update
sudo apt install -y neovim git zsh
sudo apt install -y  exa tree bat ranger ncdu stow

# Clone dotfiles repository if not already cloned
if [ ! -d "$HOME/dotfiles" ]; then
    git clone https://github.com/robren/dotfiles.git ~/dotfiles
fi


# Change default shell to Zsh if not already set
if [ "$SHELL" != "$(which zsh)" ]; then
    sudo chsh -s $(which zsh)
fi


# Stop the first time zsh exceution dialog by precreating a .zshrc if necessary
zshrc_path="$HOME/.zshrc"

if [ ! -f "$zshrc_path" ]; then
    touch "$zshrc_path"
    echo "Created .zshrc file"
else
    echo ".zshrc file already exists"
fi

## Dont clobber our zshrc if we already have one.
zshrc_path="$HOME/.zshrc"
new_zshrc_name=".zshrc.pre-stow"

if [ -f "$zshrc_path" ]; then
    mv "$zshrc_path" "$HOME/$new_zshrc_name"
    echo "Existing .zshrc file renamed to $new_zshrc_name"
fi

# Create the symlinks to the dotfiles "packages" directories
cd ~/dotfiles &&  stow -vt ~ */

# Set Zsh plugin directory
ZSH_PLUGIN_DIR=$HOME/.local/share/zsh-plugins

# Clone Powerlevel10k if not already cloned
if [ ! -d "$ZSH_PLUGIN_DIR/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_PLUGIN_DIR/powerlevel10k
fi

# Clone zsh-autosuggestions if not already cloned
if [ ! -d "$ZSH_PLUGIN_DIR/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_PLUGIN_DIR/zsh-autosuggestions
fi

# Clone zsh-syntax-highlighting if not already cloned
if [ ! -d "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGIN_DIR/zsh-syntax-highlighting
fi



echo " Reboot may be needed to switch to Zsh completely"
echo " logout and in again might work or  exec zsh"
