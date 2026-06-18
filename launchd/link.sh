#!/bin/sh
#
# Symlink launchd plists from this topic into ~/Library/LaunchAgents
# so launchd picks them up. Re-runnable; -f overwrites stale links.

set -e

AGENTS_DIR="$HOME/Library/LaunchAgents"
mkdir -p "$AGENTS_DIR"

for plist in "$(dirname "$0")"/*.plist; do
    [ -e "$plist" ] || continue
    target="$AGENTS_DIR/$(basename "$plist")"
    ln -sfF "$plist" "$target"
    echo "  Linked $(basename "$plist") -> $target"
done
