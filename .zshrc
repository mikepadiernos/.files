# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# . "$HOME/.asdf/asdf.sh"

ZSH="$HOME/.files/.zsh"
ZSH_PLUGINS="$ZSH/plugins"
ZSH_THEMES="$ZSH/themes"

# ASDF_DIR="$HOME/.files/.asdf"
ASDF_DIR="$HOME/.asdf"

fpath+=($ASDF_DIR/completions $ZSH_PLUGINS/zsh-completions/src $fpath)

autoload -Uz compinit && compinit

# source "$ZSH_THEMES"/minimal.zsh-theme
source "$ZSH_THEMES"/typewritten.zsh-theme

HIST_STAMPS="yyyy.mm.dd"

source "$ZSH_PLUGINS"/zsh-F-Sy-H/zsh-F-Sy-H.plugin.zsh                                              # zsh-F-Sy-H
# source "$ZSH_PLUGINS"/zsh-fast-syntax-highlighting/zsh-fast-syntax-highlighting.plugin.zsh          # zsh-fast-syntax-highlighting

# composer
# ddev
# gh
# git
# lando-alias-zsh
# zeza
# zsh-alias-finder

source "$ZSH_PLUGINS"/asdf/asdf.plugin.zsh															# asdf

source "$ZSH_PLUGINS"/zsh-abbr/zsh-abbr.plugin.zsh                                                  # zsh-abbr
source "$ZSH_PLUGINS"/zsh-asdf-direnv/zsh-asdf-direnv.plugin.zsh							        # zsh-asdf-direnv
source "$ZSH_PLUGINS"/zsh-autocomplete/zsh-autocomplete.plugin.zsh									# zsh-autocomplete
source "$ZSH_PLUGINS"/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh							# zsh-autosuggestions
source "$ZSH_PLUGINS"/zsh-check-deps/zsh-check-deps.plugin.zsh                                      # zsh-check-deps
# source "$ZSH_PLUGINS"/zsh-colors/zsh-colors.plugin.zsh                                              # zsh-colors
source "$ZSH_PLUGINS"/zsh-completions/zsh-completions.plugin.zsh									# zsh-completions
source "$ZSH_PLUGINS"/zsh-docker-helpers/zsh-docker-helpers.plugin.zsh                              # zsh-docker-helpers
source "$ZSH_PLUGINS"/zsh-drupal/zsh-drupal.plugin.zsh                                              # zsh-drupal
source "$ZSH_PLUGINS"/zsh-eza/zsh-eza.plugin.zsh													# zsh-eza
# source "$ZSH_PLUGINS"/zsh-eza-ls-plugin/zsh-eza-ls-plugin.plugin.zsh					     		  # zsh-eza-ls-plugin
# source "$ZSH_PLUGINS"/zsh-F-Sy-H/zsh-F-Sy-H.plugin.zsh                                              # zsh-F-Sy-H
# source "$ZSH_PLUGINS"/zsh-fast-syntax-highlighting/zsh-fast-syntax-highlighting.plugin.zsh          # zsh-fast-syntax-highlighting
source "$ZSH_PLUGINS"/zsh-figures/zsh-figures.plugin.zsh                                            # zsh-figures
# source "$ZSH_PLUGINS"/zsh-file-manager/zsh-file-manager.plugin.zsh                                  # zsh-file-manager
# source "$ZSH_PLUGINS"/zsh-fzf-brew/zsh-fzf-brew.plugin.zsh                                          # zsh-fzf-brew
# source "$ZSH_PLUGINS"/zsh-fzf-dir-navigator/zsh-fzf-dir-navigator.plugin.zsh                        # zsh-fzf-dir-navigator
source "$ZSH_PLUGINS"/zsh-fzf-git-branches/zsh-fzf-git-branches.plugin.zsh                          # zsh-fzf-git-branches
source "$ZSH_PLUGINS"/zsh-fzf-history-search/zsh-fzf-history-search.plugin.zsh						# zsh-fzf-history-search
source "$ZSH_PLUGINS"/zsh-fzf-plugin/zsh-fzf-plugin.plugin.zsh                                      # zsh-fzf-plugin
source "$ZSH_PLUGINS"/zsh-fzf-tab/zsh-fzf-tab.plugin.zsh                                            # zsh-fzf-tab
source "$ZSH_PLUGINS"/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh			# zsh-history-substring-search
# source "$ZSH_PLUGINS"/zsh-ls/zsh-ls.plugin.zsh                                                      # zsh-ls
source "$ZSH_PLUGINS"/zsh-magic-dashboard/zsh-magic-dashboard.plugin.zsh							# zsh-magic-dashboard
# source "$ZSH_PLUGINS"/zsh-ssh/zsh-ssh.plugin.zsh                                                    # zsh-ssh
# source "$ZSH_PLUGINS"/zsh-ssh-agent/zsh-ssh-agent.plugin.zsh                                        # zsh-ssh-agent
# source "$ZSH_PLUGINS"/zsh-ssh-plugin/zsh-ssh-plugin.zsh                                             # zsh-ssh-plugin
# source "$ZSH_PLUGINS"/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh	     			# zsh-syntax-highlighting

bindkey "^[[H"   beginning-of-line
bindkey "^[[F"   end-of-line
bindkey "^[[3~"  delete-char

# alias lzd='lazydocker'
alias lzg='lazygit'

f() {
	fff "$@"
	cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# # linuxbrew: php@8.1
# export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/php@8.1/lib"
# export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/php@8.1/include"
# export PATH="/home/linuxbrew/.linuxbrew/opt/php@8.1/bin:$PATH"
# export PATH="/home/linuxbrew/.linuxbrew/opt/php@8.1/sbin:$PATH"

# linuxbrew: php@8.2
# export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/php@8.2/lib"
# export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/php@8.2/include"
# export PATH="/home/linuxbrew/.linuxbrew/opt/php@8.2/bin:$PATH"
# export PATH="/home/linuxbrew/.linuxbrew/opt/php@8.2/sbin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  													# This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  								# This loads nvm bash_completion

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
# [[ -f /home/mikepadiernos/.dart-cli-completion/zsh-config.zsh ]] && . /home/mikepadiernos/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
