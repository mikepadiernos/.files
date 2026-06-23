#!/usr/bin/env bash

set -euo pipefail

MAILDIR_ROOT="${HOME}/Library/.library/.maildir"
ACCOUNTS=(
  "mike@padiernos.me"
  "mike.padiernos@gmail.com"
  "mike.padiernos@outlook.com"
)

# target folder : preferred source folder candidates (first existing wins per account)
TARGET_MAP=(
  "INBOX:INBOX"
  "Sent:Sent|[Gmail]/Sent Mail"
  "Spam:Spam|Junk|[Gmail]/Spam"
  "Trash:Trash|Deleted|[Gmail]/Trash"
  "Drafts:Drafts|[Gmail]/Drafts"
  "Archived:Archive|Archives|[Gmail]/All Mail"
)

ensure_maildir() {
  local target="$1"
  mkdir -p "${MAILDIR_ROOT}/unified/${target}/cur" "${MAILDIR_ROOT}/unified/${target}/new" "${MAILDIR_ROOT}/unified/${target}/tmp"
}

clear_maildir() {
  local target="$1"
  find "${MAILDIR_ROOT}/unified/${target}/cur" -type f -delete
  find "${MAILDIR_ROOT}/unified/${target}/new" -type f -delete
}

first_existing_source() {
  local account="$1"
  local candidates_str="$2"
  local candidate
  local candidates=()

  IFS='|' read -r -a candidates <<< "${candidates_str}"
  for candidate in "${candidates[@]}"; do
    if [[ -d "${MAILDIR_ROOT}/${account}/${candidate}" ]]; then
      printf '%s\n' "${candidate}"
      return 0
    fi
  done

  return 1
}

copy_messages() {
  local account="$1"
  local src_rel="$2"
  local target="$3"
  local bucket

  for bucket in cur new; do
    local src_dir="${MAILDIR_ROOT}/${account}/${src_rel}/${bucket}"
    local dst_dir="${MAILDIR_ROOT}/unified/${target}/${bucket}"
    [[ -d "${src_dir}" ]] || continue

    while IFS= read -r -d '' msg; do
      local base
      local dst_name
      local dst

      base="$(basename "${msg}")"
      dst_name="${account}__${base}"
      dst="${dst_dir}/${dst_name}"

      # Hardlink when possible; fallback to copy when link cannot be made.
      ln "${msg}" "${dst}" 2>/dev/null || cp -p "${msg}" "${dst}"
    done < <(find "${src_dir}" -maxdepth 1 -type f -print0)
  done
}

for map in "${TARGET_MAP[@]}"; do
  target="${map%%:*}"
  candidates_str="${map#*:}"

  ensure_maildir "${target}"
  clear_maildir "${target}"

  for account in "${ACCOUNTS[@]}"; do
    if src_rel="$(first_existing_source "${account}" "${candidates_str}")"; then
      copy_messages "${account}" "${src_rel}" "${target}"
    fi
  done
done
