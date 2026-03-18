#!/bin/sh
#
# Install cron jobs from the crontab file

set -e

CRON_FILE="$ZSH/cron/crontab"

if [ -f "$CRON_FILE" ]; then
    echo "  Installing cron jobs from $CRON_FILE"

    # Install the crontab
    crontab "$CRON_FILE"

    echo "  \033[32m✓\033[0m Cron jobs installed successfully"
    echo "  To view current cron jobs, run: crontab -l"
else
    echo "  \033[31m✗\033[0m Cron file not found at $CRON_FILE"
    exit 1
fi