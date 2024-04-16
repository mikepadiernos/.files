# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

ZSH						="$HOME/.files/.zsh"
ZSH_PLUGINS	="$ZSH/plugins"
ZSH_THEMES		="$ZSH/themes"

ASDF_DIR			="$HOME/.files/.asdf"

fpath+=(${ASDF_DIR}/completions $ZSH_PLUGINS/zsh-completions/src $fpath)

autoload -Uz compinit && compinit

# ZSH_THEME="minimal"
ZSH_THEME		="typewritten"

HIST_STAMPS	="yyyy.mm.dd"

# plugins=(
# 			check-deps
# 			ddev
# 			docker-helpers
# 			drupal
# 			fast-syntax-highlighting
# 			fzf-zsh-plugin
# 			gh
# 			git
# 			lando-alias-zsh
# 			zsh-alias-finder
# 			zsh-autocomplete
# 			zsh-autosuggestions
# 			zsh-completions
# 			zsh-eza
# 			zsh-fzf-history-searchsource "$ZSH_PLUGINS"/
# 			zsh-history-substring-search
# 			zsh-syntax-highlighting
# 		)

source "$ZSH_PLUGINS"/drupal/drupal.plugin.zsh
source "$ZSH_PLUGINS"/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source "$ZSH_PLUGINS"/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source "$ZSH_PLUGINS"/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source "$ZSH_PLUGINS"/zsh-completions/zsh-completions.plugin.zsh
source "$ZSH_PLUGINS"/zsh-eza/zsh-eza.plugin.zsh
source "$ZSH_PLUGINS"/zsh-fzf-history-search/zsh-fzf-history-search.plugin.zsh
source "$ZSH_PLUGINS"/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
source "$ZSH_PLUGINS"/zsh-magic-dashboard/zsh-magic-dashboard.plugin.zsh
source "$ZSH_PLUGINS"/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# alias lzd='lazydocker'

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
