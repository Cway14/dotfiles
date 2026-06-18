#!/bin/sh
#
# Load (or reload) all launchd agents in this topic so changes take
# effect without a logout. Safe to run repeatedly.

set -e

for plist in "$(dirname "$0")"/*.plist; do
    [ -e "$plist" ] || continue
    label=$(basename "$plist" .plist)
    target="$HOME/Library/LaunchAgents/$(basename "$plist")"

    # Unload first (ignore errors if not currently loaded), then load.
    launchctl unload "$target" 2>/dev/null || true
    launchctl load "$target"
    echo "  Loaded $label"
done
