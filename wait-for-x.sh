#!/bin/bash
#
# Wait for X server and move mousepointer to upper left corner.
#
# Based on https://gist.github.com/tullmann/476cc71169295d5c3fe6


function LOG {
    echo $(date -R): $0: $*
}

if [ -z "$DISPLAY" ]; then
    LOG "FATAL: No DISPLAY environment variable set.  No X."
    exit 13
fi

LOG "Waiting for X Server $DISPLAY to be available"

MAX=120 # About 60 seconds
CT=0
while ! xdpyinfo >/dev/null 2>&1; do
    sleep 0.50s
    CT=$(( CT + 1 ))
    if [ "$CT" -ge "$MAX" ]; then
        LOG "FATAL: $0: Gave up waiting for X server $DISPLAY"
        exit 11
    fi
done

LOG "X is available"

xdotool mousemove 0 0
