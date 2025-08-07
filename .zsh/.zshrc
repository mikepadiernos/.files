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

export GOPATH="$HOME/.go"

# set OPENAUDIBLE_HOME="$HOME/.files/.openaudible"

export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

. "$HOME/.atuin/bin/env"

fpath+=(
  ${ZSH_PLUGINS}/zsh-completions/src
  $NEOVIM
  # $OPENAUDIBLE_HOME
  $CARGO
  $GOPATH
  $fpath
)

# export ZSH_DISABLE_COMPFIX="true"

# autoload -Uz compinit && compinit -i > /dev/null
# autoload -Uz compinit; compinit

# direnv allow

source "$ZSH_CONFIGS"/.zsh_themes
source "$ZSH_CONFIGS"/.zsh_plugins
source "$ZSH_CONFIGS"/.zsh_bindkeys
source "$ZSH_CONFIGS"/.zsh_aliases
source "$ZSH_CONFIGS"/.zsh_completions

source "$ZSH_MODULES"/.zsh_homebrew
# source "$ZSH_MODULES"/.zsh_drush
source "$ZSH_MODULES"/.zsh_node

source <(fzf --zsh)

eval "$(~/.atuin/bin/atuin init zsh)"
eval "$(~/.local/bin/mise activate zsh --shims)"
eval "$(zoxide init --cmd cd zsh)"

# autoload -Uz compinit && compinit -i > /dev/null
autoload -Uz compinit; compinit

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Lando
# export PATH="/home/mikepadiernos/.lando/bin${PATH+:$PATH}"; #landopath

# . "$HOME/.atuin/bin/env"

