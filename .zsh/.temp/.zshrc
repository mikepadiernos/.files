# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export LC_ALL=en_US.UTF-8

export EDITOR=nvim

export DIRENV_SKIP_TIMEOUT=TRUE
export FILES="$HOME/.files"
export CONFIGS="$FILES/configs"

export ZSH="$FILES/.zsh"
export ZSH_PLUGINS="$ZSH/plugins"
export ZSH_THEMES="$ZSH/themes"

export ASDF_DIR="$HOME/.asdf"
export ASDF="$ASDF_DIR"

export CARGO="$HOME/.cargo/bin"

set TMUXIFIER="$HOME/.tmux/plugins/tmuxifier/bin"

set OPENAUDIBLE_HOME="$HOME/.files/.openaudible"

fpath+=(${ASDF}/completions ${ZSH_PLUGINS}/zsh-completions/src $OPENAUDIBLE_HOME $CARGO $TMUXIFIER $fpath)

# export ZSH_DISABLE_COMPFIX="true"

# autoload -Uz compinit && compinit -i > /dev/null
# autoload -Uz compinit; compinit

# direnv allow

# config files
source "$ZSH"/configs/.zsh_themes
source "$ZSH"/configs/.zsh_plugins
source "$ZSH"/configs/.zsh_bindkeys
source "$ZSH"/configs/.zsh_aliases
source "$ZSH"/configs/.zsh_completions

# custom functionality
source "$ZSH"/custom/.zsh_homebrew
source "$ZSH"/custom/.zsh_drush

eval "$(atuin init zsh)"
eval "$(direnv hook zsh)"
eval "$(zoxide init --cmd cd zsh)"
# eval "$(tmuxifier init -)"

autoload -Uz compinit && compinit -i > /dev/null
# autoload -Uz compinit; compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Lando
export PATH="/home/mikepadiernos/.lando/bin:$PATH"; #landopath

