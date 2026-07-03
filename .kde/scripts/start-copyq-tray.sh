#!/bin/sh

if ! command -v copyq >/dev/null 2>&1; then
    exit 0
fi

copyq --start-server >/dev/null 2>&1 || exit 0

# Hide the window in case CopyQ restores it during session startup.
for _ in 1 2 3 4 5; do
    copyq hide >/dev/null 2>&1 && exit 0
    sleep 1
done

exit 0