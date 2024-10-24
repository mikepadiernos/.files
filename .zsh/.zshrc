# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export FILES="$HOME/.files"
export CONFIGS="$FILES/configs"

export ZSH="$FILES/.zsh"
export ZSH_PLUGINS="$ZSH/plugins"
export ZSH_THEMES="$ZSH/themes"

export ASDF_DIR="$HOME/.asdf"
export ASDF="$ASDF_DIR"
export ASDF_DATA_DIR="$ASDF"

export NEOVIM="$FILES/.neovim/bin"

fpath+=(${ASDF}/completions ${ZSH_PLUGINS}/zsh-completions/src $NEOVIM $fpath)

# autoload -Uz compinit && compinit
autoload -Uz compinit; compinit

# direnv allow

source "$ZSH"/.zsh_history
source "$ZSH"/.zsh_themes
source "$ZSH"/.zsh_plugins
source "$ZSH"/.zsh_homebrew
source "$ZSH"/.zsh_bindkeys
source "$ZSH"/.zsh_aliases
source "$ZSH"/.zsh_completions

eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
