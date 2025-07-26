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

echo ""
echo "Fish shell setup complete!"
echo ""
echo "To start using Fish immediately, run: exec fish"

