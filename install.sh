#!/usr/bin/env bash
# set -x # Print debugging output

# Update package lists and install dependencies if needed
# make it somwehat platform agnostic.

packages="git zsh exa tree bat ranger ncdu stow neovim"

# Check if the system is Fedora
if [ -f /etc/fedora-release ]; then
    echo "Installing utilities on Fedora..."
    update="dnf update"
    install="dnf install"

# Check if the system is Ubuntu
elif [ -f /etc/lsb-release ]; then
    echo "Installing utilities on Ubuntu..."
    # On ubuntu the default is 0.6, ancient
    sudo add-apt-repository ppa:neovim-ppa/unstable
    update="apt update"
    install="apt install"

# Check if the system is macOS
elif [ "$(uname)" == "Darwin" ]; then
    echo "Installing utilities on macOS..."
    update="brew update"
    install="brew install"

else
    echo "Unsupported operating system."
fi

sudo $update 
sudo $install $packages  -y

# Let's hold off on doing this if we can.
# lets build neovim from scratch. The one in the default repo  for ubuntu is 0.6
# the one in the neovim ppa is 0.7. building from scratch gets us to 0.10
#
# Set Zsh build  directory
#SRC_CODE_DIR=$HOME/Code
#
#if [ ! -d "$SRC_CODE_DIR/neovim" ]; then
#    git clone https://github.com/neovim/neovim.git  $SRC_CODE_DIR/neovim
#    sudo $install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen -y
#    cd $SRC_CODE_DIR/neovim
#    make
#    sudo make install
#
#fi


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


# This should switch to zsh
exec zsh

