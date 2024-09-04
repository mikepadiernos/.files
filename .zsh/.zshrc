# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# . "$HOME/.asdf/asdf.sh"

ZSH="$HOME/.files/.zsh"
ZSH_PLUGINS="$ZSH/plugins"
ZSH_THEMES="$ZSH/themes"

export ASDF_DIR="$HOME/.files/.asdf"
# export ASDF="$HOME/.asdf"

# fpath+=($ZSH_PLUGINS/zsh-completions/src $fpath)
# fpath+=($ASDF/completions $ZSH_PLUGINS/zsh-completions/src $fpath)
fpath+=(${ASDF_DIR}/completions ${ZSH_PLUGINS}/zsh-completions/src $fpath)

# autoload -Uz compinit && compinit
# autoload -Uz compinit; compinit

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

f() {
	fff "$@"
	cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}
export FFF_SORT_METHOD=0

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
