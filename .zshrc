# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

ZSH="$HOME/.files/.zsh"
ZSH_PLUGINS="$ZSH/plugins"
ZSH_THEMES="$ZSH/themes"

ASDF_DIR="$HOME/.files/.asdf"

fpath+=($ASDF_DIR/completions $ZSH_PLUGINS/zsh-completions/src $fpath)

autoload -Uz compinit && compinit

# source "$ZSH_THEMES"/minimal.zsh-theme
source "$ZSH_THEMES"/typewritten.zsh-theme

HIST_STAMPS="yyyy.mm.dd"

# ddev
# fzf-zsh-plugin
# gh
# git
# lando-alias-zsh
# zsh-alias-finder


source "$ZSH_PLUGINS"/asdf/asdf.plugin.zsh															# asdf
source "$ZSH_PLUGINS"/check-deps/check-deps.plugin.zsh												# check-deps
source "$ZSH_PLUGINS"/composer/composer.plugin.zsh													# composer
source "$ZSH_PLUGINS"/docker-helpers/docker-helpers.plugin.zsh										# docker-helpers
source "$ZSH_PLUGINS"/drupal/drupal.plugin.zsh														# drupal
source "$ZSH_PLUGINS"/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh					# fast-syntax-highlighting
source "$ZSH_PLUGINS"/history-substring-search/history-substring-search.plugin.zsh					# history-substring-search
source "$ZSH_PLUGINS"/zsh-autocomplete/zsh-autocomplete.plugin.zsh									# zsh-autocomplete
source "$ZSH_PLUGINS"/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh							# zsh-autosuggestions
source "$ZSH_PLUGINS"/zsh-completions/zsh-completions.plugin.zsh									# zsh-completions
source "$ZSH_PLUGINS"/zsh-eza/zsh-eza.plugin.zsh													# zsh-eza
source "$ZSH_PLUGINS"/zsh-fzf-history-search/zsh-fzf-history-search.plugin.zsh						# zsh-fzf-history-search
source "$ZSH_PLUGINS"/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh			# zsh-history-substring-search
source "$ZSH_PLUGINS"/zsh-magic-dashboard/zsh-magic-dashboard.plugin.zsh							# zsh-magic-dashboard
source "$ZSH_PLUGINS"/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh					# zsh-syntax-highlighting

bindkey "^[[H"   beginning-of-line
bindkey "^[[F"   end-of-line
bindkey "^[[3~"  delete-char

# alias lzd='lazydocker'

f() {
	fff "$@"
	cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
