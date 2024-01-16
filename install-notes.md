sudo apt update
sudo apt install zsh git neovim
chsh -s $(which zsh)

# logout and in again or.
exec zsh

# I want a less bloat but appealing prompt. So will not use oh-my-zsh will 
# install any plugins manually.  We have to install powerlevel10k manually as it is.

# https://github.com/romkatv/powerlevel10k
# This has instructions for just curling it without oh-my-zsh

# From the site above. Note it is wants to  install ~/powerlevel10k
# For a more  pro experience I will pick ~/.local/share It's where all the cool stuff is installed.
# The instructions do talk about installing some specific fonts, looks good enough for a VM level 
# environment without the patched fonts

# On a mac it is of course worth installing the patched fonts. I see that they can be installed automatically on iterm2
# OR we do it manually if using another term.
> Automatic font installation
> If you are using iTerm2 or Termux, p10k configure can install the recommended font for you. 
> Simply answer Yes when asked whether to install Meslo Nerd Font.
> If you are using a different terminal, proceed with manual font installation. 👇


git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.local/share/powerlevel10k
echo 'source $HOME/.local/share/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# After doing this and opening a new zsh the powerlevel configurator runs.
# It asks a bunch of questions about how you want the prompt to look then stores
# this in a ~/.p10k.zsh file.
# the resultant prompt, I chose a wider spacing looks good to me

# Now just have to see what other packages  I need and how to install them manually. And then source 'em

