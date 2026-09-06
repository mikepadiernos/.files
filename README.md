# .files

Personal Linux dotfiles and app configs.

## Application Configurations

Top-level folders are grouped by app/tool. Below is a quick map of the main application configs and what they are for.

| Folder | App | What this config contains | Upstream |
|---|---|---|---|
| `.abook` | abook | Address book and contact index settings for terminal mail workflows. | Repo: https://sourceforge.net/p/abook/code/<br>Site: https://abook.sourceforge.io/ |
| `.aerc` | aerc | Terminal email client settings, account behavior, and UI preferences. | Repo: https://git.sr.ht/~rjarry/aerc<br>Site: https://aerc-mail.org/ |
| `.atuin` | Atuin | Shell history sync/search behavior and local history storage settings. | Repo: https://github.com/atuinsh/atuin<br>Site: https://atuin.sh/ |
| `.cmus` | cmus | Terminal music player keybinds and playback defaults. | Repo: https://github.com/cmus/cmus<br>Site: https://cmus.github.io/ |
| `.copyq` | CopyQ | Clipboard manager tabs, commands, and automation snippets. | Repo: https://github.com/hluk/CopyQ<br>Site: https://hluk.github.io/CopyQ/ |
| `.ddev` | DDEV | Global DDEV helper outputs and project automation support files. | Repo: https://github.com/ddev/ddev<br>Site: https://ddev.com/ |
| `.direnv` | direnv | Per-directory environment loading rules and allowlist behavior. | Repo: https://github.com/direnv/direnv<br>Site: https://direnv.net/ |
| `.feishin` | Feishin | Desktop music client state and local runtime-related settings. | Repo: https://github.com/jeffvli/feishin |
| `.fzf` | fzf | Fuzzy finder defaults, shell integration, and key bindings. | Repo: https://github.com/junegunn/fzf<br>Site: https://junegunn.github.io/fzf/ |
| `.gtk-nocsd` | gtk-nocsd tooling | GTK CSD compatibility wrappers, shims, and blacklist handling. | Package repo: https://aur.archlinux.org/packages/gtk3-nocsd-git |
| `.haruna` | Haruna | KDE video player preferences and playback behavior settings. | Repo: https://github.com/KDE/haruna<br>Site: https://apps.kde.org/haruna/ |
| `.khard` | khard | CardDAV/contact lookup settings for terminal mail setups. | Repo: https://github.com/lucc/khard<br>Docs: https://khard.readthedocs.io/ |
| `.konsave` | konsave | KDE layout/profile export and restore presets. | Repo: https://github.com/Prayag2/konsave |
| `.lazydocker` | Lazydocker | Docker TUI layout preferences and behavior settings. | Repo: https://github.com/jesseduffield/lazydocker |
| `.lazygit` | Lazygit | Git TUI keybinds, UI behavior, and workflow preferences. | Repo: https://github.com/jesseduffield/lazygit |
| `.mbsync` | mbsync/isync | IMAP sync tool defaults and account-level sync settings. | Repo: https://git.code.sf.net/p/isync/isync<br>Site: https://isync.sourceforge.io/ |
| `.mise` | mise | Runtime/version manager tool definitions and global installs. | Repo: https://github.com/jdx/mise<br>Site: https://mise.jdx.dev/ |
| `.mpd` | MPD | Music Player Daemon defaults and library/playback config. | Repo: https://github.com/MusicPlayerDaemon/MPD<br>Site: https://www.musicpd.org/ |
| `.msmtp` | msmtp | SMTP relay configuration for CLI mail tools. | Repo: https://github.com/marlam/msmtp<br>Site: https://marlam.de/msmtp/ |
| `.ncmpcpp` | ncmpcpp | MPD client keymaps, visuals, and playback UI settings. | Repo: https://github.com/ncmpcpp/ncmpcpp<br>Site: https://rybczak.net/ncmpcpp/ |
| `.neomutt` | NeoMutt | Email client settings, macros, and mailbox behavior. | Repo: https://github.com/neomutt/neomutt<br>Site: https://neomutt.org/ |
| `.notmuch` | notmuch | Mail indexing/search configuration for local mail workflows. | Repo: https://github.com/notmuch/notmuch<br>Site: https://notmuchmail.org/ |
| `.qute` | qutebrowser | Browser keybinds, userscripts, and qutebrowser settings. | Repo: https://github.com/qutebrowser/qutebrowser<br>Site: https://www.qutebrowser.org/ |
| `.retroarch` | RetroArch | Emulator frontend settings and core-related preferences. | Repo: https://github.com/libretro/RetroArch<br>Site: https://www.retroarch.com/ |
| `.rmpc` | rmpc | Terminal MPD client preferences and behavior config. | Repo: https://github.com/mierak/rmpc |
| `.smug` | smug | tmux session templates and startup definitions. | Repo: https://github.com/ivaaaan/smug |
| `.tabby` | Tabby | Terminal emulator profiles, theme settings, and keybindings. | Repo: https://github.com/Eugeny/tabby<br>Site: https://tabby.sh/ |
| `.termusic` | termusic | Terminal music app configuration and playback defaults. | Repo: https://github.com/tramhao/termusic |
| `.tmux` | tmux | Multiplexer settings, statusline, and session behavior. | Repo: https://github.com/tmux/tmux |
| `.tridactyl` | Tridactyl | Browser extension Vim-like keymaps and custom commands. | Repo: https://github.com/tridactyl/tridactyl<br>Site: https://tridactyl.xyz/ |
| `.vivaldi` | Vivaldi | Browser profile-level preferences and local state snapshots. | Site: https://vivaldi.com/ |
| `.vscode` | Visual Studio Code | User settings, keybindings, and editor/workbench defaults. | Repo: https://github.com/microsoft/vscode<br>Site: https://code.visualstudio.com/ |
| `.yazi` | Yazi | Terminal file manager behavior, previews, and keymaps. | Repo: https://github.com/sxyazi/yazi<br>Site: https://yazi-rs.github.io/ |

Supporting directories such as `.gnupg`, `.gitenv`, and `.kde` are also tracked here for integrated workflows.

## Dependency

This repository is a required companion dependency for the shell repo at https://github.com/mikepadiernos/.zsh.

Expected layout:
- ~/.zsh from https://github.com/mikepadiernos/.zsh
- ~/.files from this repository

The shell repo expects app configs and symlink sources to exist in ~/.files.

## Main workflow

1. Keep this repo at `~/.files`.
2. Use app-specific folders (for example `.tmux`, `.yazi`, `.atuin`, `.lazygit`) as the source of truth for your config.
3. Bootstrap shell behavior from `~/.zsh/.zshrc` (from https://github.com/mikepadiernos/.zsh), which reads configuration and symlink sources from `~/.files`.
4. Use `zsh_setup` when needed:
	- `zsh_setup --pull-repos [path/to/git_repos.txt]` clones listed repos.
	- `zsh_setup --setup-venv [python-executable]` creates a local `.venv` and installs required Python dependency.
	- `zsh_setup --setup-all [path/to/git_repos.txt] [python-executable]` clones repos, prepares `.venv`, bootstraps tooling, installs zsh plugins, and applies symlinks.
5. Iterate normally: edit configs, test in the target app, then commit and push.
6. Deprecation-aware changes:
	- Treat `.zsh` in this repo as legacy content; prefer editing and tracking active shell config in `~/.zsh`.
	- Treat `.asdf` in this repo as legacy content; prefer runtime/version management updates through `mise`.
	- Avoid adding new features to `.zsh` and `.asdf` here to reduce future migration churn before removal.

## Simplified Workflow (Aligned with mikepadiernos/.zsh)

1. Clone both repositories in the expected paths.

- git clone https://github.com/mikepadiernos/.zsh ~/.zsh
- git clone https://github.com/mikepadiernos/.files ~/.files

2. Start or reload shell config.

- source ~/.zsh/.zshrc

3. Run one bootstrap command.

- zsh_setup --setup-all

4. Verify links and tooling status.

- tools --list-links
- tools --list-tools

5. Keep environment current.

- tools --update --dry-run
- tools --update

## Deprecation Notice

The `.zsh`, `.asdf`, `.kde`, and `.konsave` folders are deprecated configurations and are planned for removal in a future cleanup.
