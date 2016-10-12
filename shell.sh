#!/usr/bin/env bash

source ./init

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