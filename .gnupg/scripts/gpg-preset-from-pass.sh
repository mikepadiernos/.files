#!/usr/bin/env bash

set -euo pipefail

# Preload the OpenPGP key passphrase from pass into gpg-agent for all apps.
#
# Required:
# - gpg-agent.conf contains allow-preset-passphrase
# - pass entry stores the key passphrase on the first line
#
# Optional env vars:
# - GPG_PASSPHRASE_PASS_ENTRY: pass entry path (default: gpg/passphrase)

PASS_ENTRY="${GPG_PASSPHRASE_PASS_ENTRY:-}"

for cmd in gpg gpg-connect-agent pass; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "missing required command: $cmd" >&2
    exit 1
  fi
done

if ! command -v gpgconf >/dev/null 2>&1; then
  echo "missing required command: gpgconf" >&2
  exit 1
fi

gpgconf --reload gpg-agent >/dev/null 2>&1 || true

if [ -n "$PASS_ENTRY" ]; then
  if ! passphrase="$(pass show "$PASS_ENTRY" 2>/dev/null | sed -n '1p')" || [ -z "$passphrase" ]; then
    echo "failed to read passphrase from pass entry: $PASS_ENTRY" >&2
    exit 1
  fi
else
  for candidate in \
    gpg/passphrase \
    openpgp/passphrase \
    gnupg/passphrase \
    crypto/gpg-passphrase \
    mail/openpgp-passphrase
  do
    if passphrase="$(pass show "$candidate" 2>/dev/null | sed -n '1p')" && [ -n "$passphrase" ]; then
      PASS_ENTRY="$candidate"
      break
    fi
  done
fi

if [ -z "${passphrase:-}" ]; then
  echo "no readable OpenPGP passphrase entry found in pass" >&2
  echo "set GPG_PASSPHRASE_PASS_ENTRY to your pass entry path" >&2
  exit 1
fi

hex_passphrase="$(printf '%s' "$passphrase" | od -An -tx1 -v | tr -d ' \n')"
if [ -z "$hex_passphrase" ]; then
  echo "failed to encode passphrase" >&2
  exit 1
fi

keygrips="$(gpg --list-secret-keys --with-keygrip --with-colons 2>/dev/null | awk -F: '$1=="grp" {print $10}' | sort -u)"
if [ -z "$keygrips" ]; then
  echo "no secret keygrips found" >&2
  exit 1
fi

preset_failed=0
while IFS= read -r keygrip; do
  [ -z "$keygrip" ] && continue
  if ! printf 'PRESET_PASSPHRASE %s -1 %s\n/bye\n' "$keygrip" "$hex_passphrase" | gpg-connect-agent >/dev/null 2>&1; then
    echo "failed to preset passphrase for keygrip: $keygrip" >&2
    preset_failed=1
  fi
done <<< "$keygrips"

unset passphrase hex_passphrase

if [ "$preset_failed" -ne 0 ]; then
  exit 1
fi
