# OS detection and cross-platform helpers
# This file is prefixed with underscore to load early (before other system files)

# Detect operating system
case "$(uname -s)" in
  Darwin)
    export DOTFILES_OS="darwin"
    export DOTFILES_IS_MACOS=1
    export DOTFILES_IS_LINUX=0
    ;;
  Linux)
    export DOTFILES_OS="linux"
    export DOTFILES_IS_MACOS=0
    export DOTFILES_IS_LINUX=1
    ;;
  *)
    export DOTFILES_OS="unknown"
    export DOTFILES_IS_MACOS=0
    export DOTFILES_IS_LINUX=0
    ;;
esac

# Cross-platform clipboard functions
clipboard_copy() {
  if [[ $DOTFILES_IS_MACOS -eq 1 ]]; then
    pbcopy
  elif [[ $DOTFILES_IS_LINUX -eq 1 ]]; then
    xclip -selection clipboard
  else
    echo "Clipboard not supported on this platform" >&2
    return 1
  fi
}

clipboard_paste() {
  if [[ $DOTFILES_IS_MACOS -eq 1 ]]; then
    pbpaste
  elif [[ $DOTFILES_IS_LINUX -eq 1 ]]; then
    xclip -selection clipboard -o
  else
    echo "Clipboard not supported on this platform" >&2
    return 1
  fi
}
