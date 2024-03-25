# Installation  Notes

First one should git clone my dotfiles repo then execute the stow command as described in the README.md

The steps outlined in the code blocks can be and should, converted into a a setup shell script, 
to speed up getting a new environemnt.  This serves as a template to building the zsh plugin portion of that script


```bash 
sudo apt update
sudo apt install zsh git neovim
chsh -s $(which zsh)
```

- logout and in again or:

```bash
exec zsh
```

I want a less bloat but appealing prompt. So will not use oh-my-zsh will 
install any plugins manually.  We have to install powerlevel10k manually as it is.

# Powerlevel10k The backbone of making things look cool

This has instructions for just curling it without oh-my-zsh
[powerlevel10K GitHub] (https://github.com/romkatv/powerlevel10k)

The repo directions for a manual install show an example of  install to ~/powerlevel10k

For a more pro experience I will pick ~/.local/share/zsh-plugins. .local/share is where all the cool stuff is installed.

::: note
The instructions do talk about installing some specific fonts, looks good enough for a VM level 
environment without the patched fonts. On a Mac it is of course worth installing the patched fonts. 
I see that they can be installed automatically on iterm2
OR we do it manually if using another term.
:::

## Automatic font installation
> If you are using iTerm2 or Termux, p10k configure can install the recommended font for you. 
> Simply answer Yes when asked whether to install Menlo Nerd Font.
> If you are using a different terminal, proceed with manual font installation. 👇

## Clone the git repo and source it in our .zshrc
```zsh  
ZSH-PLUGIN-DIR=$HOME/.local/share/zsh-plugins 
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH-PLUGIN-DIR/powerlevel10k
``` 

## Source the powerlevel10.zsh-theme
```zsh  
# Add this to our .zshrc file
export ZSH-PLUGIN-DIR=$HOME/.local/share/zsh-plugins 
source $ZSH-PLUGIN/powerlevel10k/powerlevel10k.zsh-theme
``` 
After doing this and opening a new zsh the powerlevel configurator runs.
It asks a bunch of questions about how you want the prompt to look then stores  this in a ~/.p10k.zsh file.

# Additional zsh packages
Now just have to see what other packages  I need and how to install them manually. And then source 'em
```zsh
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_PLUGIN_DIR/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGIN_DIR/zsh-syntax-highlighting

```

## Additional utilities

- exa
- tree
- bat
- ranger
- ncdu
- stow
