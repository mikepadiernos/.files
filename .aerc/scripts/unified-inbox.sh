#!/usr/bin/env bash

set -euo pipefail

if ! command -v mbsync >/dev/null 2>&1; then
  echo "mbsync not found in PATH" >&2
  exit 1
fi

if ! command -v notmuch >/dev/null 2>&1; then
  echo "notmuch not found in PATH" >&2
  exit 1
fi

MBSYNC_CONFIG="${HOME}/.mbsyncrc"
if [ ! -f "${MBSYNC_CONFIG}" ]; then
  MBSYNC_CONFIG="${HOME}/.config/isyncrc"
fi

if [ ! -f "${MBSYNC_CONFIG}" ]; then
  echo "mbsync config not found (~/.mbsyncrc or ~/.config/isyncrc)" >&2
  exit 1
fi

# Keep local maildirs current, then refresh the notmuch index used by aerc.
sync_failed=0

for channel in "mike@padiernos.me" "mike.padiernos@gmail.com" "mike.padiernos@outlook.com"; do
  if ! mbsync -c "${MBSYNC_CONFIG}" "${channel}"; then
    echo "mbsync failed for channel: ${channel}" >&2
    sync_failed=1
  fi
done

notmuch new

if [ "${sync_failed}" -ne 0 ]; then
  exit 1
fi