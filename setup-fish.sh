#!/usr/bin/env bash
set -e

echo "Setting up Fish shell..."

# Check if fish is installed
if ! command -v fish &>/dev/null; then
    echo "Error: Fish shell is not installed. Please install it first."
    exit 1
fi

# Add fish to /etc/shells if not already there
FISH_PATH=$(which fish)
if ! grep -q "$FISH_PATH" /etc/shells 2>/dev/null; then
    echo "Adding fish to /etc/shells..."
    echo "$FISH_PATH" | sudo tee -a /etc/shells
fi

# Set Fish as the default shell
if [ "$SHELL" != "$FISH_PATH" ]; then
    echo "Setting Fish as default shell..."
    chsh -s "$FISH_PATH"
    echo "Default shell set to Fish. You'll need to restart your terminal or logout/login."
else
    echo "Fish is already the default shell."
fi

# Install Fisher plugin manager
echo "Installing Fisher plugin manager..."
fish -c "
if not functions -q fisher
    curl -sL https://git.io/fisher | source
    fisher install jorgebucaran/fisher
    echo 'Fisher installed successfully'
else
    echo 'Fisher is already installed'
end
"

# Install useful Fish plugins
echo "Installing recommended Fish plugins..."
fish -c "
# Install commonly useful plugins
set -l plugins franciscolourenco/done PatrickF1/fzf.fish

for plugin in \$plugins
    if not fisher list | grep -q \$plugin
        echo 'Installing \$plugin...'
        fisher install \$plugin
    else
        echo '\$plugin is already installed'
    end
end
"

# Check if fish_plugins file exists and restore plugins from it
if [ -f "$HOME/.config/fish/fish_plugins" ]; then
    echo "Restoring plugins from fish_plugins file..."
    fish -c "fisher update"
fi

echo ""
echo "Fish shell setup complete!"
echo "Installed plugins:"
fish -c "fisher list"
echo ""
echo "To start using Fish immediately, run: exec fish"
