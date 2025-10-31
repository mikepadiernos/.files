#!/bin/bash

FILES_SOURCE="$HOME/.library/.files"
FILES_TARGET="$HOME/.files"
ZSHRC_SOURCE="$FILES_SOURCE/.zsh/.zshrc"
ZSHRC_TARGET="$HOME/.zshrc"

[ -d "$FILES_SOURCE" ] || exit 1
[ -f "$ZSHRC_SOURCE" ] || exit 1

[ -L "$FILES_TARGET" ] && rm "$FILES_TARGET"
[ -e "$FILES_TARGET" ] && mv "$FILES_TARGET" "$FILES_TARGET.backup"
ln -s "$FILES_SOURCE" "$FILES_TARGET"

[ -L "$ZSHRC_TARGET" ] && rm "$ZSHRC_TARGET"
[ -e "$ZSHRC_TARGET" ] && mv "$ZSHRC_TARGET" "$ZSHRC_TARGET.backup"
ln -s "$ZSHRC_SOURCE" "$ZSHRC_TARGET"

cd "$HOME"
zsh -c 'source ~/.zshrc'