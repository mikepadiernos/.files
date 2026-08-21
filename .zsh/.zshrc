# shellcheck shell=bash disable=SC1090,SC1091
# Zsh configuration

# zmodload zsh/zprof

# Core environment
export LC_ALL=en_US.UTF-8
export SHELL="/usr/bin/zsh"
export EDITOR=nvim
export DIRENV_SKIP_TIMEOUT=TRUE

# Project paths
export FILES="$HOME/.files"
export CONFIGS="$FILES/configs"
export ZSH="$FILES/.zsh"
export ZSH_CONFIGS="$ZSH/configs"
export ZSH_MODULES="$ZSH/modules"
export ZSH_PLUGINS="$ZSH/plugins"
export ZSH_THEMES="$ZSH/themes"

# Tool paths
export CARGO="$HOME/.cargo/bin"
export GOPATH="$HOME/.go"
export GOBIN="$HOME/.go/bin"
export PASSWORD_STORE_DIR="$HOME/.pass"
export GPG_PASSPHRASE_PASS_ENTRY="gpg/passphrase"

# PATH setup
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"
[[ -d "$HOME/.local/share/pnpm" ]] && export PATH="$HOME/.local/share/pnpm:$PATH"
[[ -d "$CARGO" ]] && export PATH="$PATH:$CARGO"
[[ -d "$GOBIN" ]] && export PATH="$PATH:$GOBIN"
[[ -d "$GOPATH/bin" ]] && export PATH="$PATH:$GOPATH/bin"

# Shell bootstrap
source "${ZSH_CONFIGS}/.zsh_bootstrap"

# zprof