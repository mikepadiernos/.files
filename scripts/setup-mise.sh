#!/usr/bin/env bash

set -e

echo "Checking if mise is installed..."

if ! command -v mise &> /dev/null; then
    echo "mise not found. Installing mise..."
    curl https://mise.run | sh
    echo "mise installed successfully!"
else
    echo "mise is already installed."
fi

echo "Setting up global mise tools..."
mise install argocd atuin aws-cli bat eza fd fzf helm jq kubectl lazydocker lazygit lazyssh neovim node python ripgrep terraform tmux usage yazi zoxide
mise use --global argocd atuin aws-cli bat eza fd fzf helm jq kubectl lazydocker lazygit lazyssh neovim node python ripgrep terraform tmux usage yazi zoxide

echo "mise setup complete!"
