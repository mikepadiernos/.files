# shellcheck shell=bash disable=SC1090,SC1091
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export LC_ALL=en_US.UTF-8

export SHELL="/usr/bin/zsh"

export EDITOR=nvim

export DIRENV_SKIP_TIMEOUT=TRUE
export FILES="$HOME/.library/.files"
export CONFIGS="$FILES/configs"

export ZSH="$FILES/.zsh"
export ZSH_CONFIGS="$ZSH/configs"
export ZSH_MODULES="$ZSH/modules"
export ZSH_PLUGINS="$ZSH/plugins"
export ZSH_THEMES="$ZSH/themes"

export CARGO="$HOME/.cargo/bin"

export GOROOT="$HOME/.go"
export GOPATH="$HOME/.go"

# export AWSPATH="/usr/sbin/aws_completer"

# Configure OpenAudible path only when the app is available.
if command -v openaudible >/dev/null 2>&1 || command -v OpenAudible >/dev/null 2>&1; then
  export OPENAUDIBLE_HOME="${OPENAUDIBLE_HOME:-$HOME/.apps/openaudible}"
fi

# export LD_PRELOAD=/opt/gtk-nocsd/libgtk-nocsd.so

[[ -d "$GOROOT/bin" ]] && export PATH="$PATH:$GOROOT/bin"
[[ -d "$GOPATH/bin" ]] && export PATH="$PATH:$GOPATH/bin"

fpath+=(
  "${ZSH_PLUGINS}/zsh-completions/src"
  "$NEOVIM"
  "$CARGO"
  "$GOPATH"
)

if [[ -n "$OPENAUDIBLE_HOME" && -d "$OPENAUDIBLE_HOME" ]]; then
  fpath+=("$OPENAUDIBLE_HOME")
fi

export ZSH_DISABLE_COMPFIX="true"

source "${ZSH_CONFIGS}/.zsh_themes"
source "${ZSH_CONFIGS}/.zsh_plugins"
source "${ZSH_CONFIGS}/.zsh_bindkeys"
source "${ZSH_CONFIGS}/.zsh_aliases"
source "${ZSH_CONFIGS}/.zsh_completions"

source "${ZSH_MODULES}/.zsh_mise"

source "${ZSH_MODULES}/.zsh_drush"
source "${ZSH_MODULES}/.zsh_gh"
source "${ZSH_MODULES}/.zsh_homebrew"
# source "${ZSH_MODULES}/.zsh_node"

source <(fzf --zsh)

eval "$("$HOME"/.local/bin/mise activate zsh --shims)"

eval "$(atuin init zsh)"
eval "$(zoxide init --cmd cd zsh)"

autoload -Uz compinit
if [[ -n $(find "${ZDOTDIR:-$HOME}/.zcompdump" -mmin +1440 2>/dev/null) ]]; then
  compinit -i
else
  compinit -iC
fi
