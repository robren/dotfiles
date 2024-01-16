# Derived from a fish config by Linux dabbler
# The custom prompt provided endless fun with me configuring a prompt then it being overwritten here.
# This did highlight that the ordering of execution in startup is the things in conf.d first then this file
# http://github.com/linuxdabbler


set -U fish_user_paths $fish_user_paths $HOME/.local/bin
set -U fish_user_paths $fish_user_paths $HOME/bin

set fish_greeting           # Turns off the intro message when pulling up fish shell
set TERM "xterm-256color"   # Sets the terminal type
set EDITOR "nvim"            # Sets $EDITOR to vim
set VISUAL "geany"          # Sets $VISUAL to geany for GUI Editor

### VIM mode keybindings ###
function fish_user_key_bindings
    fish_vi_key_bindings
end

# End of VIM Keybindings


### CUSTOM FUNCTIONS ###


# Custom function for line counting
function line-count
    wc -l | string trim
end

# Custom function for counting installed programs
function count-installed
    dpkg -l | grep -c '^ii' | string trim
end

# Custom function for listing installed programs
function list-installed
    apt list --installed | string trim
end

# Custom function for listing ram hogs
function memhogs
    ps axh -o cmd:15,%mem --sort=-%mem | head | string trim
end

# Custom function for listing cpu hogs
function cpuhogs
    ps axh -o cmd:15,%cpu --sort=-%cpu | head
end

# Function to find resolutions of monitors
function resolution
    xrandr | grep \* | sed 's/59.95\*+//g'
end

# Function to print percent used hdd space of home folder
function hdd
    df -h /home | grep /dev | awk '{print $3 "/" $5}'
end

# Function to see available storage in home folder
function avail
    df -h /home | grep /dev/ | awk '{print $4}'
end


### Abbreviations  ###

abbr sai sudo apt install
abbr df 'df -h'
abbr free 'free -g'
abbr reboot 'sudo reboot'
abbr virtnetwork 'sudo virsh net-start default'
abbr h 'history'
abbr c 'clear'
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr vim 'nvim'
abbr ll 'ls -l'
abbr la 'ls -A'
abbr ls. 'ls -A | egrep "^\."'
abbr q 'exit'
abbr d 'cd ~/Downloads'
abbr doc 'cd ~/Documents'
abbr grep 'grep --color=auto'
abbr egrep 'egrep --color=auto'
abbr fgrep 'fgrep --color=auto'
abbr cp 'cp -i'
abbr mv 'mv -i'
abbr rm 'rm -i'
abbr .c 'cd ~/.config'
abbr .d 'cd ~/dotfiles'
abbr .fc 'nvim ~/.config/fish/config.fish'

