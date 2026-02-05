#!/bin/sh
# Link VSCode settings based on platform

if test "$(uname)" = "Darwin"; then
  # macOS
  vscode_dir=~/Library/Application\ Support/Code/User
elif test "$(uname)" = "Linux"; then
  # Linux
  vscode_dir=~/.config/Code/User
else
  echo "Unsupported platform for VSCode linking"
  exit 1
fi

# Create directory if it doesn't exist
mkdir -p "$vscode_dir"

ln -sfF "$ZSH/vscode/keybindings.json" "$vscode_dir/keybindings.json"
ln -sfF "$ZSH/vscode/settings.json" "$vscode_dir/settings.json"
