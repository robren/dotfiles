# .bash_profile
# Even though I am using zsh, need to make this cope with machines where there
# is no zsh installed and I cannot install it.

preferred_shell=
if [ -x /bin/zsh ]; then
  preferred_shell=/bin/zsh
fi

if [ -n "$preferred_shell" ]; then
  case $- in
    *i*) SHELL=$preferred_shell; export SHELL; echo "Going to exec /bin/zsh"; exec "$preferred_shell";;
  esac
fi

# User specific environment and startup programs


if [ -f ~/.bashrc ]; then
source  ~/.bashrc
fi


PATH=/$HOME/bin:$HOME/.local/bin:$PATH
export PATH
