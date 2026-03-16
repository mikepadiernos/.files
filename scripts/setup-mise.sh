#!/usr/bin/env bash

set -e

mise_bin="$(command -v mise || true)"

echo "Checking if mise is installed..."

if [ -z "$mise_bin" ]; then
    echo "mise not found. Installing mise..."
    curl https://mise.run | sh
    mise_bin="$HOME/.local/bin/mise"
    echo "mise installed successfully!"
else
    echo "mise is already installed."
fi

if [ ! -x "$mise_bin" ]; then
    echo "mise binary not found after installation." >&2
    exit 1
fi

echo "Setting up global mise tools..."
"$mise_bin" install android-sdk argocd atuin aws-cli bat bat-extras delta docker-compose direnv eza fd fzf gh gitconfig github-cli gitui helm jq kubectl lazydocker lazygit lazyssh neovim node pnpm python ripgrep terraform tmux usage yazi zoxide
"$mise_bin" use --global android-sdk argocd atuin aws-cli bat bat-extras delta docker-compose direnv eza fd fzf gh gitconfig github-cli gitui helm jq kubectl lazydocker lazygit lazyssh neovim node pnpm python ripgrep terraform tmux usage yazi zoxide

echo "mise setup complete!"
