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

function add_ppa() {
  for i in "$@"; do
    grep -h "^deb.*$i" /etc/apt/sources.list.d/* > /dev/null 2>&1
    if [ $? -ne 0 ]
    then
      echo "Adding ppa:$i"
      sudo add-apt-repository -y ppa:$i
    else
      echo "ppa:$i already exists"
    fi
  done
}