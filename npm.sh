#!/usr/bin/env bash

# Installing npm global modules
if ! type node &>/dev/null; then
    echo "Node is not installed yet"
elif ! cat $HOME/.npmrc &>/dev/null; then
    echo "No .npmrc file"
else
	xargs npm install -g < ./lists/npm
fi