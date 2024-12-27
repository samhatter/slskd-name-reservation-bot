#!/bin/bash

LINE_NUMBER=0

while true; do
    SLSKD_SLSK_USERNAME=$(sed "${LINE_NUMBER}q;d" "$USERNAME_FILE")
    if [ -n "$SLSKD_SLSK_USERNAME" ]; then
        export SLSKD_SLSK_USERNAME="$SLSKD_SLSK_USERNAME"
        echo "Logging into $SLSKD_SLSK_USERNAME"
        cd /slskd
        ./slskd & slskd_pid=$!
        sleep $INTERVAL
        LINE_NUMBER=$((LINE_NUMBER + 1))
    else
        echo "Reached end of file, restarting."
        LINE_NUMBER=1
    fi
    sleep $INTERVAL
done
