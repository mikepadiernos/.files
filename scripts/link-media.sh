#!/usr/bin/env zsh

DOTFILES="$HOME/.files"

# Symlinks: target -> source (relative to DOTFILES)
typeset -A LINKS=(
  "$HOME/.config/cmus"        "$DOTFILES/.cmus"
  "$HOME/.config/termusic"    "$DOTFILES/.termusic"
)

for link source in ${(kv)LINKS}; do
  if [[ -L "$link" ]]; then
    echo "skip (already linked): $link"
  elif [[ -e "$link" ]]; then
    echo "backup: $link -> ${link}.bak"
    mv "$link" "${link}.bak"
    ln -s "$source" "$link"
    echo "linked: $link -> $source"
  else
    ln -s "$source" "$link"
    echo "linked: $link -> $source"
  fi
done
