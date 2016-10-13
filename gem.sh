#!/usr/bin/env bash

source ./init.sh

flash "warning" "===\nInstalling Ruby Gems\n==="

# Installing Ruby Gems
if ! type ruby &>/dev/null; then
    flash "fail" "Ruby is not installed yet"
elif ! [ $GEM_HOME = $HOME/.gem ] &>/dev/null; then
    flash "fail" "GEM_HOME is not in a home directory"
else
	xargs gem install < ./lists/gem
	flash "success" "\nAll Ruby Gems installed\n"
fi