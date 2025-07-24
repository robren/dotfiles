# Installation Notes

This repository contains dotfiles for both **Zsh** and **Fish** shells, organized for use with GNU Stow. The setup has been split into modular scripts to support different shells and platforms.

## Quick Setup

1. Clone the dotfiles repository:
```bash
git clone https://github.com/robren/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

2. Run the installation script:
```bash
./install.sh
```

This will:
- Detect your platform (Ubuntu, Fedora, Arch, macOS)
- Install common packages (git, stow, neovim, fzf, bat, yazi, tree, fish)
- Use GNU Stow to symlink all dotfiles
- Set up your chosen shell (Fish or Zsh)

## Manual Installation Steps

If you prefer to install manually or need to troubleshoot:

### 1. Install Base Packages

**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install git stow neovim fzf bat yazi tree fish zsh
```

**Fedora:**
```bash
sudo dnf update
sudo dnf install git stow neovim fzf bat yazi tree fish zsh
```

**Arch Linux:**
```bash
sudo pacman -Syu
sudo pacman -S git stow neovim fzf bat yazi tree fish zsh
```

**macOS:**
```bash
brew update
brew install git stow neovim fzf bat yazi tree fish zsh
```

### 2. Stow Dotfiles

```bash
cd ~/dotfiles
stow -vt ~ */
```

This creates symlinks from `~` and `~/.config` to all dotfiles in the repository.

### 3. Choose Your Shell

#### Option A: Fish Shell (Recommended)

Fish provides modern features out of the box with minimal configuration.

```bash
# Set Fish as default shell
chsh -s $(which fish)

# Install Fisher plugin manager (run in fish shell)
fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"

# Install plugins (optional)
fish -c "fisher install jethrokuan/z"
fish -c "fisher install franciscolourenco/done"
```

#### Option B: Zsh Shell

For a minimal but appealing Zsh setup without Oh-My-Zsh bloat:

```bash
# Set Zsh as default shell
chsh -s $(which zsh)

# Create plugin directory
mkdir -p ~/.local/share/zsh-plugins

# Install Powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.local/share/zsh-plugins/powerlevel10k

# Install useful plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.local/share/zsh-plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.local/share/zsh-plugins/zsh-syntax-highlighting
```

After setting up Zsh, restart your shell and Powerlevel10k will run its configuration wizard.

## Shell Scripts Overview

- **`install.sh`**: Main installation script that detects platform and installs packages
- **`setup-fish.sh`**: Fish-specific setup (sets default shell, installs Fisher)
- **`setup-zsh.sh`**: Zsh-specific setup (installs plugins, sets default shell)

## Font Requirements (Zsh with Powerlevel10k)

For the best experience with Powerlevel10k:

### Automatic Installation (iTerm2/Termux)
Run `p10k configure` and answer "Yes" when prompted to install Menlo Nerd Font.

### Manual Installation
Download and install a Nerd Font from [nerdfonts.com](https://www.nerdfonts.com/). Popular choices:
- FiraCode Nerd Font
- JetBrains Mono Nerd Font
- Source Code Pro Nerd Font

## Cross-Platform Considerations

The dotfiles are designed to work across different platforms. Platform-specific configurations use conditionals:

```fish
# Example: Homebrew setup only on macOS
if test -x /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
end
```

## Utilities Included

The setup installs these modern CLI tools:
- **bat**: Syntax-highlighted `cat` replacement
- **yazi**: Modern file manager
- **fzf**: Fuzzy finder
- **tree**: Directory structure visualization
- **neovim**: Modern Vim

## Troubleshooting

### Stow Issues
- Ensure `~/.config` directory exists before running stow
- Use `stow -D */` to remove symlinks if needed
- Use `stow -vt ~ */` for verbose output

### Shell Issues
- Logout and login again after changing default shell
- Or run `exec fish` / `exec zsh` to switch immediately

### Platform-Specific
- On some systems, you may need to add the new shell to `/etc/shells` before using `chsh`
- Fisher requires Fish shell to be active when installing
