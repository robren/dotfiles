#!/usr/bin/env bash
set -e

# Common packages
PACKAGES="git stow neovim fzf bat tree fish zsh zoxide"

# Detect platform and install
if command -v dnf &>/dev/null; then
    echo "Installing on Fedora..."
    sudo dnf install -y $PACKAGES
    # lazygit needs COPR
    sudo dnf copr enable atim/lazygit -y 2>/dev/null || true
    sudo dnf install -y lazygit || echo "Warning: lazygit failed"
    # yazi
    sudo dnf install -y yazi || echo "Warning: yazi not in repos"
    
elif command -v apt &>/dev/null; then
    echo "Installing on Ubuntu/Debian..."
    sudo apt update
    sudo apt install -y $PACKAGES
    # lazygit - manual install
    if ! command -v lazygit &>/dev/null; then
        LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
        curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
        sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
        rm lazygit.tar.gz
    fi
    # yazi via snap
    command -v snap &>/dev/null && sudo snap install yazi --classic || echo "Warning: install yazi manually"
    
elif command -v pacman &>/dev/null; then
    echo "Installing on Arch..."
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm --needed $PACKAGES lazygit yazi
    
elif [ "$(uname)" == "Darwin" ]; then
    echo "Installing on macOS..."
    command -v brew &>/dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install $PACKAGES lazygit yazi
    
else
    echo "Unsupported OS"
    exit 1
fi

# Clone dotfiles if needed
[ ! -d "$HOME/dotfiles" ] && git clone https://github.com/robren/dotfiles.git ~/dotfiles
cd ~/dotfiles

FISHDIR="$HOME/.config/fish"

# Only back up real files (skip if the whole config dir is symlinked)
if [ -d "$FISHDIR" ] && [ ! -L "$FISHDIR" ]; then
  CFG="$FISHDIR/config.fish"
  if [ -f "$CFG" ]; then
    echo "Backing up existing fish config → $CFG.backup"
    mv "$CFG" "$CFG.backup"
  fi
fi

ZSHRC="$HOME/.zshrc"
if [ -f "$ZSHRC" ] && [ ! -L "$ZSHRC" ]; then
  echo "Backing up existing zshrc → $ZSHRC.backup"
  mv "$ZSHRC" "$ZSHRC.backup"
fi

# Now cd into your dotfiles repo before stowing
cd ~/dotfiles


# Install dotfiles with stow
echo ""
echo "Install dotfiles:"
echo "1) All"
echo "2) Minimal (fish )"
echo "3) Skip"
read -p "Choice (1-3): " choice

case $choice in
    1) stow -vt ~ */ ;;
    2) stow -vt ~ fish ;;
    3) ;;
esac

# Install Kitty
if ! command -v kitty &>/dev/null; then
    read -p "Install Kitty? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        case "$(uname)" in
            Linux) curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin ;;
            Darwin) brew install --cask kitty ;;
        esac
    fi
fi

# Setup shell
echo ""
echo "Setup shell:"
echo "1) Fish"
echo "2) Zsh"
echo "3) Skip"
read -p "Choice (1-3): " shell_choice

case $shell_choice in
    1) [ -x "./setup-fish.sh" ] && ./setup-fish.sh ;;
    2) [ -x "./setup-zsh.sh" ] && ./setup-zsh.sh ;;
esac

echo ""
echo "Done! Next steps:"
command -v fish &>/dev/null && echo "• Try fish: fish"
command -v zsh &>/dev/null && echo "• Try zsh: zsh"
echo "• Change default shell: chsh -s \$(which fish)"
echo "• Install a Nerd Font"
