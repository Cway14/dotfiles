# GRC colorizes nifty unix tools all over the place
if (( $+commands[grc] ))
then
  # Try Homebrew location first
  if [[ -n "$HOMEBREW_PREFIX" && -f "$HOMEBREW_PREFIX/etc/grc.bashrc" ]]; then
    source "$HOMEBREW_PREFIX/etc/grc.bashrc"
  # Linux system location fallback
  elif [[ -f "/etc/grc.bashrc" ]]; then
    source "/etc/grc.bashrc"
  fi
fi
