#!/usr/bin/env bash

source ./init.sh

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    flash "warning" "===\nConfiguring shell\n==="
    sudo apt-get install -y zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    echo "
    source $HOME/.aliases
    source $HOME/.functions
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh    
    export GOPATH=$HOME/.gocode
    export GEM_HOME=$HOME/.gem
    export PATH=$GOPATH/bin:$HOME/.npm/bin:$HOME/.config/composer/vendor/bin:$GEM_HOME/bin:$PATH
    " >> ZSHRC
    chsh -s /bin/zsh
    flash "success" "\nShell configured\n"
fi