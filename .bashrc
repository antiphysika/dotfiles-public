##
# ~/.bashrc
##

# Keep track of the number of times this bashrc is sourced
#
[[ -z $_BASHRC_SOURCED ]] && _BASHRC_SOURCED=0
((_BASHRC_SOURCED += 1))

## {{{ Check to see if running interactively
case "$-" in
  *i*)
    # Interactive; do nothing
    ;;
  *)
    # Non-interactive; return immediately
    return
    ;;
esac
## }}}

# Clear screen
clear

# Print output from "uname -a" on first invokation
[[ $_BASHRC_SOURCED -eq 1 ]] && echo >&2 -e "$(uname -a)\n"

# Source additional .bashrc_* files
for _BASHRC_FILE_PATH in "$HOME"/.bashrc_*
do
  case "$_BASHRC_FILE_PATH" in
    */.*.swp)  continue ;;
  esac

  _BASHRC_FILE_NAME="$(basename "$_BASHRC_FILE_PATH")"

  # Source .bashrc_local and .bashrc_keychain last
  [[ $_BASHRC_FILE_NAME == .bashrc_local ]] && continue
  [[ $_BASHRC_FILE_NAME == .bashrc_keychain ]] && continue

  # Make sure $_BASHRC_FILE_PATH exists
  [[ -f $_BASHRC_FILE_PATH ]] || continue

  echo >&2 "... Sourcing ${_BASHRC_FILE_PATH/$HOME/\~}"
  source "$_BASHRC_FILE_PATH"
done

unset _BASHRC_FILE_PATH
unset _BASHRC_FILE_NAME

# Source ~/.bashrc_local last, if it exists
if [[ -f ~/.bashrc_local ]]
then
  echo >&2 "... Sourcing ~/.bashrc_local"
  source ~/.bashrc_local
fi

# Ditto ~/.bashrc_keychain
if [[ -f ~/.bashrc_keychain ]]
then
  echo >&2 "... Sourcing ~/.bashrc_keychain"
  source ~/.bashrc_keychain
fi

# Clean up PATH using helper script
[[ -n $(type -P path-clean.py) ]] && export PATH="$(path-clean.py)"

# Handle $SCREEN_CHDIR as set in .screenrc
if [[ -n $SCREEN_CHDIR ]]
then
  cd "$SCREEN_CHDIR"
  unset SCREEN_CHDIR
else
  # Change to $HOME directory on first invokation
  [[ $_BASHRC_SOURCED -eq 1 ]] && cd "$HOME"
fi

##
# vim: ts=2 sw=2 et fdm=marker :
##
