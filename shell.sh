#!/usr/bin/env bash

export DOTFILES_DIR
export ZSHRC
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ZSHRC="$HOME/.zshrc"

# Install Oh My ZSH

if [ ! -d "$HOME/.oh-my-zsh" ]; then

    sudo apt-get install -y zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    echo "
    source $HOME/.aliases
    source $HOME/.functions
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh    
    export GOPATH=$HOME/.gocode
    export GEM_HOME=~/.gem
    " >> ZSHRC

    chsh -s /bin/zsh

fi

# Create symlinks

ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~
ln -sfv "$DOTFILES_DIR/.npmrc" ~
ln -sfv "$DOTFILES_DIR/.aliases" ~
ln -sfv "$DOTFILES_DIR/.functions" ~
ln -sfv "$DOTFILES_DIR/.editorconfig" ~