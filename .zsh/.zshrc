# shellcheck shell=bash disable=SC1090,SC1091
# Zsh configuration

# Localization
export LC_ALL=en_US.UTF-8

# Shell and Editor
export SHELL="/usr/bin/zsh"
export EDITOR=nvim
export DIRENV_SKIP_TIMEOUT=TRUE

# Directory Paths
export FILES="$HOME/.files"
export CONFIGS="$FILES/configs"

# Zsh-Specific Paths
export ZSH="$FILES/.zsh"
export ZSH_CONFIGS="$ZSH/configs"
export ZSH_MODULES="$ZSH/modules"
export ZSH_PLUGINS="$ZSH/plugins"
export ZSH_THEMES="$ZSH/themes"

# Tool-Specific Paths
export CARGO="$HOME/.cargo/bin"
export PASSWORD_STORE_DIR="$HOME/.pass"
export GPG_PASSPHRASE_PASS_ENTRY="gpg/passphrase"

# Optional Paths (commented out)
# export AWSPATH="/usr/sbin/aws_completer"
# export LD_PRELOAD=/opt/gtk-nocsd/libgtk-nocsd.so

# PATH Setup
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"
[[ -d "$HOME/.local/share/pnpm" ]] && export PATH="$HOME/.local/share/pnpm:$PATH"
[[ -d "$CARGO" ]] && export PATH="$PATH:$CARGO"

# Theme, plugins, and key bindings
source "${ZSH_CONFIGS}/.zsh_themes"
source "${ZSH_CONFIGS}/.zsh_plugins"
source "${ZSH_CONFIGS}/.zsh_bindkeys"
source "${ZSH_CONFIGS}/.zsh_aliases"
source "${ZSH_MODULES}/.zsh_openaudible"
source "${ZSH_MODULES}/.zsh_go"
source "${ZSH_CONFIGS}/.zsh_completions"

# Module configurations
source "${ZSH_MODULES}/.zsh_mise"
source "${ZSH_MODULES}/.zsh_homebrew"
source "${ZSH_MODULES}/.zsh_gpg"
source "${ZSH_MODULES}/.zsh_drush"
source "${ZSH_MODULES}/.zsh_composer"
source "${ZSH_MODULES}/.zsh_git"
source "${ZSH_MODULES}/.zsh_gh"
source "${ZSH_MODULES}/.zsh_node"
source "${ZSH_MODULES}/.zsh_setup"
source "${ZSH_MODULES}/.zsh_tools"

# Tool Initialization
source <(fzf --zsh)
eval "$("$HOME"/.local/bin/mise activate zsh --shims)"
eval "$(atuin init zsh)"
eval "$(zoxide init --cmd cd zsh)"

