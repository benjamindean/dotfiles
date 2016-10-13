#!/usr/bin/env bash

source ./init.sh

flash "warning" "===\nInstalling packages\n==="

for i in $( cat ./lists/ppa ); do
    add_ppa $i
done

echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
echo steam steam/question select "I AGREE" | sudo debconf-set-selections
sudo sed -i "/^# deb .*partner/ s/^# //" /etc/apt/sources.list
sudo apt update
xargs sudo apt install -y < ./lists/packages

# Install Chrome
install_package google-chrome-stable "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

# Install Skype
install_package skypeforlinux "https://go.skype.com/skypeforlinux-64-alpha.deb"

# Install Slack
install_package slack "https://downloads.slack-edge.com/linux_releases/slack-desktop-2.2.1-amd64.deb"

# Install Node
function install_node() {
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
	sudo apt-get install -y nodejs
}

install_package node "" install_node

# Install Spotify
function install_spotify() {
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
	echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
	sudo apt update
	sudo apt install spotify-client -y
}

install_package spotify "" install_spotify

# Install Composer
function install_composer() {
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
	php -r "if (hash_file('SHA384', 'composer-setup.php') === 'e115a8dc7871f15d853148a7fbac7da27d6c0030b848d9b3dc09e2a0388afed865e6a3d6b3c0fad45c48e2b5fc1196ae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
	php composer-setup.php
	php -r "unlink('composer-setup.php');"
	sudo mv composer.phar /usr/local/bin/composer
}

install_package composer "" install_composer


# Install missing deps
sudo apt install -f -y

flash "success" "\nAll packages installed\n"