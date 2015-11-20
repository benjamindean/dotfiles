#!/usr/bin/env bash

export DOTFILES_DIR
export ZSHRC
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ZSHRC="$HOME/.zshrc"

# Install Oh My Zsh

if [ ! -d "$HOME/.oh-my-zsh" ]; then

    sudo apt-get install -y zsh
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    echo "\nsource ~/.aliases\nsource ~/.functions" >> ZSHRC

    if [ git --version 2>/dev/null -eq 0 ]; then
        sudo add-apt-repository ppa:git-core/ppa -y
        sudo apt-get install git
    else
        git clone git://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
        sed -i -- 's/plugins=(git)/plugins=(git zsh-syntax-highlighting)/g' ZSHRC
        sed -i -- 's/ZSH_THEME="robbyrussell"/ZSH_THEME="gallois"/g' ZSHRC
    fi

fi

# Update dotfiles

[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Create symlinks

ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~
ln -sfv "$DOTFILES_DIR/.npmrc" ~
ln -sfv "$DOTFILES_DIR/.aliases" ~
ln -sfv "$DOTFILES_DIR/.functions" ~
ln -sfv "$DOTFILES_DIR/.editorconfig" ~
