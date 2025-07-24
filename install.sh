#!/usr/bin/env bash
set -e

# Common packages to install (yazi handled separately due to availability differences)
COMMON_PACKAGES="git stow neovim fzf bat tree fish  zoxide zsh"

# Function to install yazi based on platform
install_yazi() {
    case "$1" in
        "ubuntu"|"debian")
            # Try snap first, fallback to manual install suggestion
            if command -v snap &>/dev/null; then
                sudo snap install yazi --classic || echo "Warning: Could not install yazi via snap. Consider installing from GitHub releases."
            else
                echo "Warning: yazi not available via apt. Consider installing from GitHub releases or snap."
            fi
            ;;
        "arch")
            # yazi is available in Arch repos
            sudo pacman -S --noconfirm yazi
            ;;
        "fedora")
            # yazi might not be in default repos, try copr or suggest manual install
            dnf install -y yazi || echo "Warning: yazi not found in default repos. Consider installing from GitHub releases."
            ;;
        "macos")
            brew install yazi
            ;;
    esac
}

# Detect platform and install packages
if command -v dnf &>/dev/null && [ -f /etc/fedora-release ]; then
    echo "Installing on Fedora..."
    dnf update -y
    dnf install -y $COMMON_PACKAGES
    install_yazi "fedora"
elif command -v apt &>/dev/null && [ -f /etc/debian_version ]; then
    echo "Installing on Ubuntu/Debian..."
    sudo apt update
    sudo apt install -y $COMMON_PACKAGES
    install_yazi "ubuntu"
elif command -v pacman &>/dev/null && ([ -f /etc/arch-release ] || grep -qi arch /etc/os-release); then
    echo "Installing on Arch Linux..."
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm $COMMON_PACKAGES
    install_yazi "arch"
elif [ "$(uname)" == "Darwin" ]; then
    echo "Installing on macOS..."
    if ! command -v brew &>/dev/null; then
        echo "Homebrew not found. Installing Homebrew first..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew update
    brew install $COMMON_PACKAGES
    install_yazi "macos"
else
    echo "Unsupported operating system or package manager not found."
    echo "Please install the following packages manually: $COMMON_PACKAGES yazi"
    exit 1
fi

echo "Base packages installed successfully."

# Clone dotfiles if not present
if [ ! -d "$HOME/dotfiles" ]; then
    echo "Cloning dotfiles repository..."
    git clone https://github.com/robren/dotfiles.git ~/dotfiles
else
    echo "Dotfiles directory already exists."
fi

# Navigate to dotfiles directory
cd ~/dotfiles

# Backup existing configs if they exist and aren't symlinks
backup_if_exists() {
    if [ -f "$1" ] && [ ! -L "$1" ]; then
        echo "Backing up existing $1 to $1.backup"
        mv "$1" "$1.backup"
    fi
}

backup_if_exists "$HOME/.zshrc"
backup_if_exists "$HOME/.config/fish/config.fish"

# Stow all dotfiles (each subdir should be a stow package)
echo "Creating symlinks with stow..."
stow -vt ~ */

# Ask user which shell they prefer
echo ""
echo "Which shell would you like to set up?"
echo "1) Fish (modern, user-friendly)"
echo "2) Zsh (traditional, highly customizable)"
read -p "Enter choice (1 or 2): " shell_choice

case $shell_choice in
    1)
        if [ -x "./setup-fish.sh" ]; then
            ./setup-fish.sh
        else
            echo "setup-fish.sh not found, skipping Fish setup"
        fi
        ;;
    2)
        if [ -x "./setup-zsh.sh" ]; then
            ./setup-zsh.sh
        else
            echo "setup-zsh.sh not found, skipping Zsh setup"
        fi
        ;;
    *)
        echo "Invalid choice. You can run ./setup-fish.sh or ./setup-zsh.sh manually later."
        ;;
esac

echo ""
echo "Installation complete! You may need to:"
echo "1. Restart your terminal or run 'exec \$SHELL'"
echo "2. Install a Nerd Font for best terminal experience"
echo "3. Configure your terminal to use the new font"
