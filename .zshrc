# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

ASDF_DIR="$HOME/.files/.asdf"

fpath+=($ASDF_DIR/completions ${ZSH_CUSTOM:-${ZSH:-~/.omz}/custom}/plugins/zsh-completions/src $fpath)

autoload -Uz compinit && compinit

# Path to your oh-my-zsh installation.
ZSH="$HOME/.files/.omz"

# ZSH_PLUGINS	= "$HOME/.files/.zsh/plugins"
# ZSH_THEMES	= "$HOME/.files/.zsh/themes"

# ZSH_THEME="robbyrussell"
# ZSH_THEME="pure"
# ZSH_THEME="minimal"
ZSH_THEME="typewritten"
# ZSH_THEME="common"

COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
HIST_STAMPS="yyyy.mm.dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(
#			asdf
			check-deps
			ddev
			docker-helpers
			drupal
			fast-syntax-highlighting
# 			fzf-zsh-plugin
			gh
			git
			lando-alias-zsh
			zsh-alias-finder
# 			zsh-asdf-direnv
			zsh-autocomplete
			zsh-autosuggestions
			zsh-completions
			zsh-eza
			zsh-fzf-history-search
			zsh-history-substring-search
			zsh-syntax-highlighting
		)

source $ZSH/oh-my-zsh.sh
source $HOME/.files/.zsh/plugins/asdf/asdf.plugin.zsh
source $HOME/.files/.zsh/plugins/zsh-magic-dashboard/magic_dashboard.zsh

# zsh aliases
# alias lzd='lazydocker'

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# asdf integrations:
# . "$HOME/.asdf/asdf.sh"																# asdf & git
# echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc			# asdf & brew
# export PATH="/usr/local/opt/php@8.1/bin:$PATH"
# export PATH="/usr/local/opt/php@8.1/sbin:$PATH"
