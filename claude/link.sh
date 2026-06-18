#!/bin/sh
# Bootstrap ~/.claude symlink based on the active Claude profile.
# Profile selection state lives in ~/.claude-active-profile.
# Default profile (when no state file exists) is "personal".
# This script does NOT touch Keychain or ~/.claude.json — that is the
# job of `claude-profile` (in bin/).

set -eu

state_file="$HOME/.claude-active-profile"
personal_dir="$HOME/.dotfiles/claude"
work_dir="$HOME/.dotfiles.sap/claude"

if [ -f "$state_file" ]; then
    profile="$(cat "$state_file")"
else
    profile="personal"
    echo "$profile" > "$state_file"
fi

case "$profile" in
    personal) target="$personal_dir" ;;
    work)     target="$work_dir" ;;
    *)
        echo "claude/link.sh: unknown profile '$profile' in $state_file" >&2
        exit 1
        ;;
esac

if [ ! -d "$target" ]; then
    echo "claude/link.sh: profile directory $target does not exist" >&2
    exit 1
fi

# -n: treat existing symlink as a file (don't dereference into the target dir)
# -f: force replace
ln -sfn "$target" "$HOME/.claude"

echo "Claude profile linked: $profile ($target)"
