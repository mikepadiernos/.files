#!/usr/bin/env bash

set -euo pipefail

APP_DISPLAY_NAME="mbsync-outlook-oauth"
OAUTH_ENV_FILE="${HOME}/.config/mbsync/outlook-oauth.env"
REDIRECT_URI="https://login.microsoftonline.com/common/oauth2/nativeclient"

if ! command -v az >/dev/null 2>&1; then
  echo "azure-cli (az) is required." >&2
  exit 1
fi

# Work around Azure CLI subscription-selector crashes for accounts with no subscriptions.
AZURE_CORE_NO_COLOR=1 az config set core.login_experience_v2=off -o none >/dev/null 2>&1 || true

echo "Checking Azure authentication..."
if ! AZURE_CORE_NO_COLOR=1 az ad signed-in-user show -o none >/dev/null 2>&1; then
  echo "Starting az login (allow no subscriptions)..."
  AZURE_CORE_NO_COLOR=1 az login --allow-no-subscriptions --use-device-code -o none || \
    AZURE_CORE_NO_COLOR=1 az login --allow-no-subscriptions --use-device-code --tenant organizations -o none
fi

if ! AZURE_CORE_NO_COLOR=1 az ad signed-in-user show -o none >/dev/null 2>&1; then
  echo "Unable to access Microsoft Entra user context via az ad." >&2
  echo "This usually means the account has no Entra tenant directory context." >&2
  echo "For Outlook OAuth app registration, use one of these:" >&2
  echo "  1) Sign in with a work/school account that has tenant access" >&2
  echo "  2) Create a free Entra developer tenant, then rerun this script" >&2
  exit 1
fi

echo "Looking for existing app registration: ${APP_DISPLAY_NAME}"
APP_ID="$(AZURE_CORE_NO_COLOR=1 az ad app list --display-name "${APP_DISPLAY_NAME}" --query '[0].appId' -o tsv 2>/dev/null || true)"

if [[ -z "${APP_ID}" ]]; then
  echo "Creating app registration..."
  APP_ID="$(AZURE_CORE_NO_COLOR=1 az ad app create \
    --display-name "${APP_DISPLAY_NAME}" \
    --sign-in-audience AzureADandPersonalMicrosoftAccount \
    --is-fallback-public-client true \
    --public-client-redirect-uris "${REDIRECT_URI}" \
    --query appId -o tsv)"
fi

if [[ -z "${APP_ID}" ]]; then
  echo "Failed to resolve app registration client ID." >&2
  exit 1
fi

mkdir -p "$(dirname "${OAUTH_ENV_FILE}")"
cat > "${OAUTH_ENV_FILE}" <<EOF
export MUTT_OAUTH2_MICROSOFT_CLIENT_ID=${APP_ID}
EOF
chmod 600 "${OAUTH_ENV_FILE}"

echo "Saved Outlook OAuth client ID to ${OAUTH_ENV_FILE}"
echo "Next: run ~/.files/.mbsync/setup-outlook-oauth.sh --reset"
