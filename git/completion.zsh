# Uses git's autocompletion for inner commands.
# Checks multiple locations for cross-platform compatibility.

completion=""

# Try Homebrew location first
if [[ -n "$HOMEBREW_PREFIX" && -f "$HOMEBREW_PREFIX/share/zsh/site-functions/_git" ]]; then
  completion="$HOMEBREW_PREFIX/share/zsh/site-functions/_git"
# Linux system location fallback
elif [[ -f "/usr/share/zsh/vendor-completions/_git" ]]; then
  completion="/usr/share/zsh/vendor-completions/_git"
elif [[ -f "/usr/share/zsh/functions/Completion/Unix/_git" ]]; then
  completion="/usr/share/zsh/functions/Completion/Unix/_git"
fi

if [[ -n "$completion" && -f "$completion" ]]; then
  source "$completion"
fi
