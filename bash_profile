# .bash_profile
# Even though I am using zsh, need to make this cope with machines where there
# is no zsh installed and I cannot install it.

preferred_shell=
if [ -x /bin/zsh ]; then
  preferred_shell=/bin/zsh
fi

if [ -n "$preferred_shell" ]; then
  case $- in
    *i*) SHELL=$preferred_shell; export SHELL; exec "$preferred_shell";;
  esac
fi

# Get the aliases and functions
#if [ -f ~/.bashrc ]; then
#	. ~/.bashrc
#fi

# User specific environment and startup programs

PATH=/usr/local/bin:$PATH:$HOME/.local/bin:$HOME/bin:/usr/texbin:/usr/local/opt/ruby/bin


export PATH
export VMAIL_HTML_PART_READER='elinks -dump'
export VMAIL_VIM='mvim'
#ssh-agent  Experiment wiht ssh-keychain
#echo "This is from bash_profile"


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
