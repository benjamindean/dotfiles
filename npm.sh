#!/usr/bin/env bash

source ./init.sh

flash "warning" "===\nInstalling npm modules\n==="

if ! type node &>/dev/null; then
    flash "fail" "Node is not installed yet"
elif ! cat $HOME/.npmrc &>/dev/null; then
    flash "fail" "No .npmrc file"
else
	xargs npm install -g < ./lists/npm
	flash "success" "\nAll npm modules installed\n"
fi