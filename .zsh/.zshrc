# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

FILES="$HOME/.files"
CONFIGS="$FILES/configs"

ZSH="$FILES/.zsh"
ZSH_PLUGINS="$ZSH/plugins"
ZSH_THEMES="$ZSH/themes"

ASDF="$FILES/.asdf"

fpath+=(${ASDF}/completions ${ZSH_PLUGINS}/zsh-completions/src $fpath)

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
