#!/usr/bin/env bash

set -euo pipefail

TOKEN_FILE="${HOME}/.config/mbsync/mike.padiernos@outlook.com.oauth2.token"
OAUTH_HELPER="${HOME}/.files/.mbsync/mutt_oauth2.py"
MBSYNC_CONFIG="${HOME}/.mbsyncrc"
CHANNEL="mike.padiernos@outlook.com"
OAUTH_ENV_FILE="${HOME}/.config/mbsync/outlook-oauth.env"

if [[ ! -f "${OAUTH_HELPER}" ]]; then
  echo "Missing OAuth helper: ${OAUTH_HELPER}" >&2
  exit 1
fi

if [[ ! -f "${MBSYNC_CONFIG}" ]]; then
  echo "Missing mbsync config: ${MBSYNC_CONFIG}" >&2
  exit 1
fi

if [[ -f "${OAUTH_ENV_FILE}" ]]; then
  # shellcheck disable=SC1090
  source "${OAUTH_ENV_FILE}"
fi

if [[ -z "${MUTT_OAUTH2_MICROSOFT_CLIENT_ID:-}" ]]; then
  echo "MUTT_OAUTH2_MICROSOFT_CLIENT_ID is not set." >&2
  echo "Run ~/.files/.mbsync/setup-azure-outlook-app.sh first." >&2
  exit 1
fi

mkdir -p "$(dirname "${TOKEN_FILE}")"

if [[ "${1:-}" == "--reset" ]]; then
  rm -f "${TOKEN_FILE}"
fi

echo "Starting Microsoft OAuth device-code flow for ${CHANNEL}..."
python3 "${OAUTH_HELPER}" "${TOKEN_FILE}" --authorize --authflow devicecode

echo "Testing Outlook channel sync..."
mbsync -c "${MBSYNC_CONFIG}" -V "${CHANNEL}"

echo "Done. Outlook OAuth is configured for mbsync channel ${CHANNEL}."