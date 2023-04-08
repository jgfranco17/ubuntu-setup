#!/bin/bash
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
sudo apt update && sudo apt upgrade
sudo apt install -y curl
sudo apt install build-essential

# Configure dev tools
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install -y nodejs
sudo apt install git
curl -fsSL -o install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
brew install tree
brew install pyenv
