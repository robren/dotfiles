#!/usr/bin/env bash
set -e

# Common packages to install (kitty handled separately, yazi handled specially)
COMMON_PACKAGES="git stow neovim fzf bat tree fish zsh lazygit"

# Function to install yazi based on platform
install_yazi() {
    local platform="$1"
    case "$platform" in
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

# Store platform for later use
PLATFORM=""

# Detect platform and install packages
if command -v dnf &>/dev/null && [ -f /etc/fedora-release ]; then
    echo "Installing on Fedora..."
    PLATFORM="fedora"
    dnf update -y
    dnf install -y $COMMON_PACKAGES
    install_yazi "fedora"
elif command -v apt &>/dev/null && [ -f /etc/debian_version ]; then
    echo "Installing on Ubuntu/Debian..."
    PLATFORM="ubuntu"
    sudo apt update
    sudo apt install -y $COMMON_PACKAGES
    install_yazi "ubuntu"
elif command -v pacman &>/dev/null && ([ -f /etc/arch-release ] || grep -qi arch /etc/os-release); then
    echo "Installing on Arch Linux..."
    PLATFORM="arch"
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm $COMMON_PACKAGES
    install_yazi "arch"
elif [ "$(uname)" == "Darwin" ]; then
    echo "Installing on macOS..."
    PLATFORM="macos"
    if ! command -v brew &>/dev/null; then
        echo "Homebrew not found. Installing Homebrew first..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew update
    brew install $COMMON_PACKAGES
    install_yazi "macos"
else
    echo "Unsupported operating system or package manager not found."
    echo "Please install the following packages manually: $COMMON_PACKAGES yazi kitty"
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

# Function to show available dotfile packages
show_packages() {
    echo "Available dotfile packages:"
    for dir in */; do
        if [ -d "$dir" ]; then
            package=$(basename "$dir")
            echo "  - $package"
        fi
    done
}

# Function to select packages interactively
select_packages() {
    echo ""
    echo "Select which dotfile packages to install:"
    show_packages
    echo ""
    echo "Options:"
    echo "1) Install all packages"
    echo "2) Select packages individually"
    echo "3) Install recommended minimal set (fish, git, utilities)"
    read -p "Enter choice (1-3): " package_choice
    
    case $package_choice in
        1)
            echo "Installing all packages..."
            stow -vt ~ */
            ;;
        2)
            echo ""
            echo "Enter package names to install (space-separated):"
            echo "Available: $(ls -d */ | tr -d '/' | tr '\n' ' ')"
            read -p "Packages: " selected_packages
            
            if [ -n "$selected_packages" ]; then
                for package in $selected_packages; do
                    if [ -d "$package" ]; then
                        echo "Installing $package..."
                        stow -vt ~ "$package"
                    else
                        echo "Warning: Package '$package' not found"
                    fi
                done
            else
                echo "No packages selected."
            fi
            ;;
        3)
            echo "Installing minimal recommended set..."
            minimal_packages="fish git"
            # Add utilities if it exists
            [ -d "utilities" ] && minimal_packages="$minimal_packages utilities"
            # Add kitty if it exists
            [ -d "kitty" ] && minimal_packages="$minimal_packages kitty"
            
            for package in $minimal_packages; do
                if [ -d "$package" ]; then
                    echo "Installing $package..."
                    stow -vt ~ "$package"
                else
                    echo "Package '$package' not found, skipping..."
                fi
            done
            ;;
        *)
            echo "Invalid choice. Skipping dotfile installation."
            return
            ;;
    esac
}

# Install Kitty terminal emulator
install_kitty() {
    echo ""
    read -p "Install Kitty terminal emulator? (y/n): " install_kitty_choice
    
    if [ "$install_kitty_choice" = "y" ] || [ "$install_kitty_choice" = "Y" ]; then

       # Create necessary local directories before installation
        echo "Creating local directories..."
        mkdir -p ~/.local/{bin,lib,share/{applications,icons,fonts}}
        mkdir -p ~/.config/kitty/themes

        case "$1" in
            "ubuntu"|"debian")
                # Kitty installer script (recommended method)
                curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
                # Create desktop entry
                ln -sf ~/.local/kitty.app/bin/kitty ~/.local/bin/
                cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
                sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop
                ;;
            "arch")
                sudo pacman -S --noconfirm kitty
                ;;
            "fedora")
                dnf install -y kitty
                ;;
            "macos")
                brew install --cask kitty
                ;;
        esac
        echo "Kitty installed!"
        
        # Install Catppuccin theme
        echo "Installing Catppuccin theme for Kitty..."
        mkdir -p ~/.config/kitty/themes
        curl -o ~/.config/kitty/themes/catppuccin-mocha.conf https://raw.githubusercontent.com/catppuccin/kitty/main/themes/catppuccin-mocha.conf
        curl -o ~/.config/kitty/themes/catppuccin-macchiato.conf https://raw.githubusercontent.com/catppuccin/kitty/main/themes/catppuccin-macchiato.conf
        curl -o ~/.config/kitty/themes/catppuccin-frappe.conf https://raw.githubusercontent.com/catppuccin/kitty/main/themes/catppuccin-frappe.conf
        curl -o ~/.config/kitty/themes/catppuccin-latte.conf https://raw.githubusercontent.com/catppuccin/kitty/main/themes/catppuccin-latte.conf
        echo "Catppuccin themes installed to ~/.config/kitty/themes/"
    fi
}

# Select which packages to install
select_packages

# Install Kitty if requested
install_kitty "$PLATFORM"

# Ask user which shell they prefer
echo ""
echo "Which shell would you like to set up?"
echo "1) Fish (modern, user-friendly)"
echo "2) Zsh (traditional, highly customizable)"
echo "3) Skip shell setup"
read -p "Enter choice (1-3): " shell_choice

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
    3)
        echo "Skipping shell setup"
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
