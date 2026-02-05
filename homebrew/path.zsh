# Homebrew path configuration for macOS and Linux
# Detect and set HOMEBREW_PREFIX based on platform and architecture

if [[ -d "/opt/homebrew" ]]; then
  # Apple Silicon Mac
  export HOMEBREW_PREFIX="/opt/homebrew"
elif [[ -d "/usr/local/Homebrew" ]]; then
  # Intel Mac
  export HOMEBREW_PREFIX="/usr/local"
elif [[ -d "/home/linuxbrew/.linuxbrew" ]]; then
  # Linuxbrew (standard location)
  export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
elif [[ -d "$HOME/.linuxbrew" ]]; then
  # Linuxbrew (user install)
  export HOMEBREW_PREFIX="$HOME/.linuxbrew"
fi

if [[ -n "$HOMEBREW_PREFIX" ]]; then
  export PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$PATH"
  export MANPATH="$HOMEBREW_PREFIX/share/man${MANPATH+:$MANPATH}:"
  export INFOPATH="$HOMEBREW_PREFIX/share/info:${INFOPATH:-}"
fi
