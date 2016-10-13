#!/usr/bin/env bash

# Installing Ruby Gems
if ! type ruby &>/dev/null; then
    echo "Ruby is not installed yet"
elif ! [ $GEM_HOME = $HOME/.gem ] &>/dev/null; then
    echo "GEM_HOME is not in a home directory"
else
	xargs gem install < ./lists/gem
fi