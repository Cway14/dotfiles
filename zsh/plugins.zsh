# Load zsh plugins using HOMEBREW_PREFIX (set in homebrew/path.zsh)
# Falls back gracefully if files don't exist

if [[ -n "$HOMEBREW_PREFIX" ]]; then
  # zsh-syntax-highlighting
  if [[ -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  fi

  # zsh-autosuggestions
  if [[ -f "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  fi
fi

# Starship prompt
if (( $+commands[starship] )); then
  eval "$(starship init zsh)"
fi
