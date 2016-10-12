export DEB_FOLDER="$HOME/Downloads/DEB"

function install_package() {
	if ! type $1 &>/dev/null; then
		wget $2 -O $DEB_FOLDER/$1.deb
		sudo dpkg -i $DEB_FOLDER/$1.deb
	fi
}

xargs apt-add-repository < ppa.txt
xargs sudo apt install -y < packages.txt

install_package skypeforlinux "https://go.skype.com/skypeforlinux-64-alpha.deb"