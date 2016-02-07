#!/usr/bin/env bash

export DOTFILES_DIR
export ZSHRC
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ZSHRC="$HOME/.zpreztorc"

# Install git

if [ git --version 2>/dev/null -eq 0 ]; then
    sudo add-apt-repository ppa:git-core/ppa -y
    sudo apt-get update
    sudo apt-get install git
fi

# Update dotfiles

[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Install Prezto

if [ ! -d "$HOME/.zprezto" ]; then

    sudo apt-get install -y zsh
    sh -c "git clone --recursive https://github.com/sorin-ionescu/prezto.git '${ZDOTDIR:-$HOME}/.zprezto'"

    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}/.zprezto/runcoms/^README.md(.N)"; do
      ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
    ln -sf .zpreztorc $HOME/.zpreztorc
    echo "\nsource ~/.aliases\nsource ~/.functions" >> ZSHRC

    chsh -s /bin/zsh

fi

# Create symlinks

ln -sfv "$DOTFILES_DIR/.zpreztorc" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~
ln -sfv "$DOTFILES_DIR/.npmrc" ~
ln -sfv "$DOTFILES_DIR/.aliases" ~
ln -sfv "$DOTFILES_DIR/.functions" ~
ln -sfv "$DOTFILES_DIR/.editorconfig" ~

xargs apt-add-repository < ppa.txt
xargs sudo apt install -y < packages.txt

echo "All done!"
