#!/usr/bin/env bash
set -e

echo "Setting up Zsh shell..."

# Check if zsh is installed
if ! command -v zsh &>/dev/null; then
    echo "Error: Zsh is not installed. Please install it first."
    exit 1
fi

ZSH_PLUGIN_DIR=$HOME/.local/share/zsh-plugins

# Create plugin directory
mkdir -p "$ZSH_PLUGIN_DIR"

# Add zsh to /etc/shells if not already there
ZSH_PATH=$(which zsh)
if ! grep -q "$ZSH_PATH" /etc/shells 2>/dev/null; then
    echo "Adding zsh to /etc/shells..."
    echo "$ZSH_PATH" | sudo tee -a /etc/shells
fi

# Set Zsh as the default shell
if [ "$SHELL" != "$ZSH_PATH" ]; then
    echo "Setting Zsh as default shell..."
    chsh -s "$ZSH_PATH"
    echo "Default shell set to Zsh. You'll need to restart your terminal or logout/login."
else
    echo "Zsh is already the default shell."
fi

# Install Powerlevel10k theme
if [ ! -d "$ZSH_PLUGIN_DIR/powerlevel10k" ]; then
    echo "Installing Powerlevel10k theme..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_PLUGIN_DIR/powerlevel10k"
else
    echo "Powerlevel10k is already installed."
fi

# Install zsh-autosuggestions
if [ ! -d "$ZSH_PLUGIN_DIR/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_PLUGIN_DIR/zsh-autosuggestions"
else
    echo "zsh-autosuggestions is already installed."
fi

# Install zsh-syntax-highlighting
if [ ! -d "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting" ]; then
    echo "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting"
else
    echo "zsh-syntax-highlighting is already installed."
fi

echo ""
echo "Zsh shell setup complete!"
echo "Installed components:"
echo "  - Powerlevel10k theme"
echo "  - zsh-autosuggestions"
echo "  - zsh-syntax-highlighting"
echo ""
echo "Next steps:"
echo "1. Start a new Zsh session: exec zsh"
echo "2. Run 'p10k configure' to set up your prompt"
echo "3. Install a Nerd Font for the best experience"
