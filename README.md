# .files

Personal Linux dotfiles and app configs.

## Apps in this repo

Top-level folders are grouped by app/tool. Current configs include:

- abook
- aerc
- asdf
- atuin
- browsers
- cmus
- copyq
- ddev
- direnv
- feishin
- fzf
- gitenv
- goto
- gtk-nocsd
- haruna
- kde
- khard
- konsave
- lazydocker
- lazygit
- mbsync
- mise
- mpd
- msmtp
- nc
- ncmpcpp
- neomutt
- notmuch
- qute
- retroarch
- rmpc
- smug
- tabby
- termusic
- tmux
- tridactyl
- vivaldi
- vscode
- yazi
- zsh

Also tracked here are supporting directories such as `.gnupg` and `.local`.

## Main workflow

1. Keep this repo at `~/.files`.
2. Use app-specific folders (for example `.zsh`, `.tmux`, `.yazi`) as the source of truth for your config.
3. Bootstrap shell behavior from `.zsh/.zshrc`, which sets `FILES="$HOME/.files"` and sources the zsh modules/configs from this repo.
4. Use `zsh_setup` when needed:
	- `zsh_setup --pull-repos [path/to/git_repos.txt]` clones listed repos.
	- `zsh_setup --setup-venv [python-executable]` creates a local `.venv` and installs required Python dependency.
	- `zsh_setup --setup-all [path/to/git_repos.txt] [python-executable]` runs both.
5. Iterate normally: edit configs, test in the target app, then commit and push.
