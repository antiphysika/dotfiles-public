##
# ~/.profile
##

umask 022

if test `id -u` -eq 0; then
  PS1='# '
else
  PS1='$ '
fi

if test x"$BASH_VERSION" != x; then
  if test -f ~/.bashrc; then
    source ~/.bashrc
  fi
fi

if test -d "$HOME/bin"; then
  PATH="$HOME/bin:$PATH"
fi

##
# vim: ts=2 sw=2 et fdm=marker :
##
