#!/usr/bin/env bash

source ./init.sh

flash "warning" "===\nCreating symlinks\n==="

ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~
ln -sfv "$DOTFILES_DIR/files/.npmrc" ~
ln -sfv "$DOTFILES_DIR/files/.aliases" ~
ln -sfv "$DOTFILES_DIR/files/.functions" ~
ln -sfv "$DOTFILES_DIR/files/.editorconfig" ~

flash "success" "\nSymlinks created\n"