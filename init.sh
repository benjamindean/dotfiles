#!/usr/bin/env bash

export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export ZSHRC="$HOME/.zshrc"
export DEB_FOLDER="$HOME/Downloads/DEB"

function install_package() {
	if ! type $1 &>/dev/null; then
		wget $2 -O $DEB_FOLDER/$1.deb
		sudo dpkg -i $DEB_FOLDER/$1.deb
	fi
}