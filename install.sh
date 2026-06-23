#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="${HOME}/.files"
SCRIPTS_DIR="${DOTFILES_DIR}/scripts"
PRETTY_LIB="${SCRIPTS_DIR}/lib/pretty.sh"

SETUP_CORE_SCRIPT="${SCRIPTS_DIR}/setup-core.sh"
SETUP_CORE_DEPENDENCIES_SCRIPT="${SCRIPTS_DIR}/setup-core-dependencies.sh"
SETUP_ZSH_SCRIPT="${SCRIPTS_DIR}/setup-zsh.sh"
SETUP_MAIL_DIRECTORIES_SCRIPT="${SCRIPTS_DIR}/setup-mail-directories.sh"
SETUP_MAIL_NEOMUTT_SCRIPT="${SCRIPTS_DIR}/setup-mail-neomutt.sh"
LINK_PRODUCTIVITY_SCRIPT="${SCRIPTS_DIR}/link-productivity.sh"
LINK_MEDIA_SCRIPT="${SCRIPTS_DIR}/link-media.sh"

run_bash_script() {
	local script_path="$1"
	if [[ ! -x "${script_path}" ]]; then
		chmod +x "${script_path}"
	fi
	pretty_info "Running ${script_path}"
	bash "${script_path}"
}

run_zsh_script() {
	local script_path="$1"
	if [[ ! -x "${script_path}" ]]; then
		chmod +x "${script_path}"
	fi
	pretty_info "Running ${script_path}"
	zsh "${script_path}"
}

if [[ ! -d "${DOTFILES_DIR}" ]]; then
	echo "Missing dotfiles directory: ${DOTFILES_DIR}" >&2
	exit 1
fi

if [[ ! -d "${SCRIPTS_DIR}" ]]; then
	echo "Missing scripts directory: ${SCRIPTS_DIR}" >&2
	exit 1
fi

if [[ ! -f "${PRETTY_LIB}" ]]; then
	echo "Missing pretty output library: ${PRETTY_LIB}" >&2
	exit 1
fi

# shellcheck source=/dev/null
source "${PRETTY_LIB}"

pretty_section "Stage 1: Core dependencies"
run_bash_script "${SETUP_CORE_DEPENDENCIES_SCRIPT}"

pretty_section "Stage 2: Core setup"
run_bash_script "${SETUP_CORE_SCRIPT}"

pretty_section "Stage 3: Shell setup"
run_bash_script "${SETUP_ZSH_SCRIPT}"

pretty_section "Stage 4: Mail setup"
run_bash_script "${SETUP_MAIL_DIRECTORIES_SCRIPT}"
run_bash_script "${SETUP_MAIL_NEOMUTT_SCRIPT}"

pretty_section "Stage 5: Dotfile links"
run_zsh_script "${LINK_PRODUCTIVITY_SCRIPT}"
run_zsh_script "${LINK_MEDIA_SCRIPT}"

pretty_success "Install complete"