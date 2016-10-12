#!/usr/bin/env bash

function install_package() {
	if ! type $1 &>/dev/null; then
		wget $2 -O $DEB_FOLDER/$1.deb
		sudo dpkg -i $DEB_FOLDER/$1.deb
	fi
}

xargs sudo apt-add-repository < ./lists/ppa
xargs sudo apt install -y < ./lists/packages

install_package skypeforlinux "https://go.skype.com/skypeforlinux-64-alpha.deb"