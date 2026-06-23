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
export GOROOT="$HOME/.go"
export GOPATH="$HOME/.go"
export PASSWORD_STORE_DIR="$HOME/.pass"

# Optional Paths (commented out)
# export AWSPATH="/usr/sbin/aws_completer"
# export LD_PRELOAD=/opt/gtk-nocsd/libgtk-nocsd.so

# Configure OpenAudible path only when the app is available
if command -v openaudible >/dev/null 2>&1 || command -v OpenAudible >/dev/null 2>&1; then
  export OPENAUDIBLE_HOME="${OPENAUDIBLE_HOME:-$HOME/.apps/openaudible}"
fi

# PATH Setup
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"
[[ -d "$HOME/.local/share/pnpm" ]] && export PATH="$HOME/.local/share/pnpm:$PATH"
[[ -d "$CARGO" ]] && export PATH="$PATH:$CARGO"
[[ -d "$GOROOT/bin" ]] && export PATH="$PATH:$GOROOT/bin"
[[ -d "$GOPATH/bin" ]] && export PATH="$PATH:$GOPATH/bin"

# Theme, plugins, and key bindings
source "${ZSH_CONFIGS}/.zsh_themes"
source "${ZSH_CONFIGS}/.zsh_plugins"
source "${ZSH_CONFIGS}/.zsh_bindkeys"
source "${ZSH_CONFIGS}/.zsh_aliases"
source "${ZSH_CONFIGS}/.zsh_completions"

# Module configurations
source "${ZSH_MODULES}/.zsh_drush"
source "${ZSH_MODULES}/.zsh_mise"
source "${ZSH_MODULES}/.zsh_homebrew"
# source "${ZSH_MODULES}/.zsh_gh"
# source "${ZSH_MODULES}/.zsh_node"

# Tool Initialization
source <(fzf --zsh)
eval "$("$HOME"/.local/bin/mise activate zsh --shims)"
eval "$(atuin init zsh)"
eval "$(zoxide init --cmd cd zsh)"

