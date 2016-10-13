#!/usr/bin/env bash

export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export ZSHRC="$HOME/.zshrc"

export DEB_FOLDER="$HOME/Downloads/DEB"
mkdir -p DEB_FOLDER

# Colors
export COLOR_RED='\033[1;31m'
export COLOR_INFO='\033[1;34m'
export COLOR_GREEN='\033[1;32m'
export NO_COLOR='\033[0m'

function install_package() {
	if ! type $1 &>/dev/null; then
	    flash "warning" "Installing $1..."
	    if [ $2 = "" ]; then
	        $3
	    else
            wget $2 -O $DEB_FOLDER/$1.deb
            sudo dpkg -i $DEB_FOLDER/$1.deb
        fi
		flash "success" "Installed: $1"
	else
	    flash "success" "$1 is already installed"
	fi
}

function flash() {
    if [ $1 = "success" ]; then
        printf "${COLOR_GREEN}$2${NO_COLOR}\n"
    elif [ $1 = "fail" ]; then
        printf "${COLOR_RED}$2${NO_COLOR}\n"
    else
        printf "${COLOR_INFO}$2${NO_COLOR}\n"
    fi
}

function add_ppa() {
  for i in "$@"; do
    grep -h "^deb.*$i" /etc/apt/sources.list.d/* > /dev/null 2>&1
    if [ $? -ne 0 ]
    then
      flash "success" "Adding ppa:$i"
      sudo add-apt-repository -y ppa:$i
    else
      flash "warning" "ppa:$i already exists"
    fi
  done
}