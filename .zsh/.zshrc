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
typeset -U path PATH
[[ -d "$HOME/.local/bin" ]] && path=("$HOME/.local/bin" $path)
[[ -d "$HOME/.local/share/pnpm" ]] && path=("$HOME/.local/share/pnpm" $path)
[[ -d "$CARGO" ]] && path=($path "$CARGO")
[[ -d "$GOBIN" ]] && path=($path "$GOBIN")
[[ -d "$GOPATH/bin" ]] && path=($path "$GOPATH/bin")

# Shell bootstrap
source "${ZSH_CONFIGS}/.zsh_bootstrap"

# zprof
